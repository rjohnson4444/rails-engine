class Api::V1::MostRevenueController < ApplicationController
  respond_to :json

  def index
    # returns the top (x) merchants rankedby total revenue
  end
end
