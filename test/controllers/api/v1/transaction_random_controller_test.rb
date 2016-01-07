require 'test_helper'

class Api::V1::TransactionRandomControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns random transaction" do
    get :index, format: :json

    assert json_response["invoice_id"]
    assert json_response["credit_card_number"]
    assert json_response["result"]
  end
end
