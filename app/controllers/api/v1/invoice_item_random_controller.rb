class Api::V1::InvoiceItemRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.random_invoice_item
  end
end
