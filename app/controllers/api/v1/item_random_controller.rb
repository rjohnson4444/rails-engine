class Api::V1::ItemRandomController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.random_item
  end
end
