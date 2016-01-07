require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Invoice.first.id, format: :json

    assert_response :success
  end

  test "#index returns the customer associated with the invoice" do
    get :index, id: Invoice.first.id, format: :json

    assert_equal Invoice.first.customer.id, json_response["id"]
  end
end
