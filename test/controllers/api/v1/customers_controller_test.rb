require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "index return all customers" do
    skip
    get :index

    assert_response :success
  end
end
