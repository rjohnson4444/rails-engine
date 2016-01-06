class Api::V1::InvoiceRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.random_invoice
  end
end
