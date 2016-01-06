require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "index return all customers" do
    get :index

    assert_response :success
  end

  test "show returns specified customer by id" do
    get :show, { id: "2" }

    assert_response :success
  end
end
