class Api::V1::TransactionRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.random_transaction
  end
end
