class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).merchant
  end
end
