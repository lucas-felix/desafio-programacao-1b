require 'test_helper'

class PurchaseHistoryTest < ActiveSupport::TestCase
  test "should return correct quantity of imported data" do
    purchases_file = File.open("dados.txt")
    quantity = PurchaseHistory.import purchases_file

    assert_equal 4, quantity
  end

  test "should last register correnponds to last line of file" do
    purchases_file = File.open("dados.txt")
    quantity = PurchaseHistory.import purchases_file

    purchase = PurchaseHistory.last

    assert_equal "Snake Plissken", purchase.buyer.name
    assert_equal "R$20 Sneakers for R$5", purchase.description
    assert_equal 5.0, purchase.item_price
    assert_equal 4, purchase.quantity
    assert_equal "123 Fake St", purchase.buyer.address.street
    assert_equal "Sneaker Store Emporium", purchase.product.supplier.name
  end
end
