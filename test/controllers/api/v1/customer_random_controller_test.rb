require 'test_helper'

class Api::V1::CustomerRandomControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns random customer" do
    get :index, format: :json

    assert json_response["first_name"]
    assert json_response["last_name"]
  end
end
