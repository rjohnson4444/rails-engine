class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.find(params[:id]).invoice
  end
end
