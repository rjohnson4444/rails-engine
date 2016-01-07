require 'test_helper'

class Api::V1::ItemRandomControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns random item" do
    get :index, format: :json

    assert json_response["name"]
    assert json_response["description"]
    assert json_response["merchant_id"]
  end
end
