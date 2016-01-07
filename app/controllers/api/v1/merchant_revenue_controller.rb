class Api::V1::MerchantRevenueController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all_revenue_by_date(params[:date])
  end
end
