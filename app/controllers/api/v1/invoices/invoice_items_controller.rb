class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).invoice_items
  end
end
