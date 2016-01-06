class Api::V1::MerchantRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.random_merchant
  end
end
