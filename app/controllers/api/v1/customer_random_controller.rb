class Api::V1::CustomerRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.random_customer
  end
end
