require "rails_helper"

RSpec.describe PurchasesController, :type => :controller do
  describe "GET #new" do
    before(:each) { get :new }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "POST #import" do
    it "redirects to recent after upload purchases file" do
      purchases_file = fixture_file_upload('dados.txt', 'text/plain')

      post :import, purchases_file: purchases_file

      expect(response).to redirect_to(recent_path(quantity: 4))
    end
  end

  describe "GET #recent" do
    before(:each) { get :recent, quantity: 4 }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("recent")
    end

    it "assign @purchases" do
      purchases = PurchaseHistory.recent(4)
      expect(assigns(:purchases)).to eq(purchases)
    end

    it "assign @amount" do
      amount = PurchaseHistory.total_price_of_lasts(4)
      expect(assigns(:amount)).to eq(amount)
    end
  end
end