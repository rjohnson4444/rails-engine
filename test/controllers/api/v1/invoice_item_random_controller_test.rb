require 'test_helper'

class Api::V1::InvoiceItemRandomControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns random invoice_item" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["item_id"]
    assert json_response["invoice_id"]
    assert json_response["quantity"]
    assert json_response["unit_price"]
  end
end
