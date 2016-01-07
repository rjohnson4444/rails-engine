require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of merchants" do
    get :index, format: :json

    assert_equal Merchant.count, json_response.count
  end

  test "#index contains merchants that have the correct properties" do
    get :index, format: :json

    json_response.each do |merchant|
      assert merchant["name"]
    end
  end

  test "#show responds to json" do
    get :show, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#show returns one merchant" do
    get :show, format: :json, id: Merchant.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct merchant" do
    get :show, format: :json, id: Merchant.first.id

    assert_equal Merchant.first.id, json_response["id"]
  end
end
