require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Customer.first.id, format: :json

    assert_response :success
  end
end
