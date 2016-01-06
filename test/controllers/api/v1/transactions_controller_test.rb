require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "index return all transaction" do
    get :index

    assert_response :success
  end

  test "show returns specified transaction by id" do
    get :show

    assert_response :success
  end
end
