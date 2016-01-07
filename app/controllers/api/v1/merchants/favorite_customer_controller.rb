class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end
end
