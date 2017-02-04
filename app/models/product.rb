class Product < ActiveRecord::Base
  belongs_to :supplier

  validates :description, :item_price, presence: true
  validates :item_price, numericality: { greater_than_or_equal_to: 0 }
end
