require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
    get :index, format: :json

    assert_equal Item.count, json_response.count
  end

  test "#index contains items that have the correct properties" do
    get :index, format: :json

    json_response.each do |item|
      assert item["name"]
      assert item["description"]
      assert item["merchant_id"]
    end
  end

  test "#show responds to json" do
    get :show, format: :json, id: Item.first.id

    assert_response :success
  end

  test "#show returns one item" do
    get :show, format: :json, id: Item.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    get :show, format: :json, id: Item.first.id

    assert_equal Item.first.id, json_response["id"]
  end
end
