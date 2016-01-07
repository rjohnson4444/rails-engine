require 'test_helper'

class Api::V1::InvoiceRandomControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns random invoice" do
    get :index, format: :json

    assert json_response["customer_id"]
    assert json_response["merchant_id"]
    assert json_response["status"]
  end
end
