require 'test_helper'

class Api::V1::ItemFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one item" do
    get :index, format: :json

    assert_equal Item.first.id, json_response["id"]
  end

  test "#index contains a item that has the correct properties" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["name"]
    assert json_response["description"]
    assert json_response["merchant_id"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of items" do
    get :show, format: :json

    assert_equal Item.count, json_response.count
  end

  test "#show contains items that have the correct properties" do
    get :show, format: :json

    json_response.each do |item|
      assert item["name"]
      assert item["description"]
      assert item["merchant_id"]
      assert item["unit_price"]
    end
  end
end
