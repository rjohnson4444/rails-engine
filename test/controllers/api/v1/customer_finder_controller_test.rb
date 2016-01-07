require 'test_helper'

class Api::V1::CustomerFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one customer" do
    get :index, format: :json

    assert_equal Customer.first.id, json_response["id"]
  end

  test "#index contains a customer that has the correct properties" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["first_name"]
    assert json_response["last_name"]
    assert json_response["created_at"]
    assert json_response["updated_at"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of customers" do
    get :show, format: :json

    assert_equal Customer.count, json_response.count
  end

  test "#show contains customers that have the correct properties" do
    get :show, format: :json

    json_response.each do |customer|
      assert customer["first_name"]
      assert customer["last_name"]
    end
  end
end
