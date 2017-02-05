class PurchasesController < ApplicationController
  def new
  end

  def import
    imported_quantity = PurchaseHistory.import params[:purchases_file]

    flash[:notice] = t(:data_successfully_imported)

    redirect_to action: :recent, quantity: imported_quantity
  end

  def recent
    @purchases = PurchaseHistory.recent(params[:quantity])
    @amount = PurchaseHistory.total_price_of_lasts(params[:quantity])
  end
end
