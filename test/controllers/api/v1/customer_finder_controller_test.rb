require 'test_helper'

class Api::V1::CustomerFinderControllerTest < ActionController::TestCase
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
      assert item["first_name"]
      assert item["last_name"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end
end
