class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json, :xml

  def show
    # returns the date with the most sales for the given item suing the invoice date
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end
