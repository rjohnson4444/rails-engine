class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json

  def show
    # returns the date with the most sales for the given item using the invoice date
  end
end
