require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should import repot" do
    assert_difference("PurchaseHistory.count") do
      purchases_file = fixture_file_upload("dados.txt", "text/plain")
      post :import, params: { tsv_report: purchases_file }
    end

    assert_redirected_to :recent  
  end
end
