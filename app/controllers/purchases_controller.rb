class PurchasesController < ApplicationController
  def new
  end

  def import
    imported_quantity = PurchaseHistory.import params[:tsv_report]

    flash[:notice] = t(:data_successfully_imported)
    redirect_to action: :recent, quantity: imported_quantity
  end

  def recent
    @purchases = PurchaseHistory.recent(params[:quantity])
    @amount = @purchases.map{ |purchase| purchase.quantity * purchase.item_price }.inject(:+)
  end
end
