require 'test_helper'

class Api::V1::CustomerFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one customer" do
    get :index, format: :json

    assert_equal 1, json_response.count
  end

  test "#index contains a customer that has the correct properties" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["first_name"]
    assert json_response["last_name"]
    assert json_response["created_at"]
    assert json_response["updated_at"]
  end
end
