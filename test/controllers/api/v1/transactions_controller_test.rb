require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "index return all transaction" do
    skip
    get :index

    assert_response :success
  end
end
