class PurchaseHistory < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :product

  validates :quantity, :description, :item_price, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.in_order
    order(created_at: :asc)
  end

  def self.recent(n)
    in_order.endmost(n)
  end

  def self.endmost(n)
    all.only(:order).from(all.reverse_order.limit(n), table_name)
  end

  def self.import(report_file)
    purchases_file_content = report_file.read.force_encoding("UTF-8")

    csv = CSV.parse(purchases_file_content, col_sep: "\t", headers: true, converters: :numeric)

      csv.each do |report_row|
        purchase = create_purchase(report_row)

        purchase.save
      end

    csv.size
  end

  private

  def self.create_purchase(report_row)
    purchase = PurchaseHistory.new
    purchase.quantity = report_row["Quantidade"]

    buyer = Buyer.find_or_initialize_by(name: report_row["Comprador"])
    address = Address.find_or_initialize_by(street: report_row["Endereço"])
    buyer.address = address

    product = Product.find_or_initialize_by(description: report_row["descrição"]) do |product|
      product.item_price = report_row["Preço Uniário"]
    end

    supplier = Supplier.find_or_initialize_by(name: report_row["Fornecedor"])
    product.supplier = supplier

    purchase.buyer = buyer
    purchase.product = product
    purchase.description = product.description
    purchase.item_price = product.item_price

    purchase
  end
end
