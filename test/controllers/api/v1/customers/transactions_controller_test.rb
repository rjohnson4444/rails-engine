require 'test_helper'

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json, id: Customer.first.id

    assert_response :success
  end

end
