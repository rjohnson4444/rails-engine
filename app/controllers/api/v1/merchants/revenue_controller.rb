class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def show
    # returns the total revenue for that merchant across all transactions
    if params[:date]
      respond_with Merchant.revenue_by_date(params[:date], params[:id])
    else
      respond_with Merchant.revenue(params[:id])
    end
  end
end
