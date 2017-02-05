require "rails_helper"

RSpec.describe PurchaseHistory, :type => :model do
  it "should return correct quantity of imported data" do
    purchases_file = File.open("dados.txt")
    quantity = PurchaseHistory.import purchases_file

    expect(quantity).to eq 4
  end

  it "should last register correnponds to last line of file" do
    purchases_file = File.open("dados.txt")
    quantity = PurchaseHistory.import purchases_file

    purchase = PurchaseHistory.last

    expect(purchase.buyer.name).to eq "Snake Plissken"
    expect(purchase.description).to eq "R$20 Sneakers for R$5"
    expect(purchase.item_price).to eq 5.0
    expect(purchase.quantity).to eq 4
    expect(purchase.buyer.address.street).to eq "123 Fake St"
    expect(purchase.product.supplier.name).to eq "Sneaker Store Emporium"
  end
end