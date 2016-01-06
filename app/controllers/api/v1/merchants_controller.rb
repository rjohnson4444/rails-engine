class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.random_merchant
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end