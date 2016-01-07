require 'test_helper'

class Api::V1::MerchantFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one merchant" do
    get :index, format: :json

    assert_equal Merchant.first.id, json_response["id"]
  end

  test "#index contains a merchant that has the correct properties" do
    get :index, format: :json

    assert json_response["name"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of merchants" do
    get :show, format: :json

    assert_equal Merchant.count, json_response.count
  end

  test "#show contains merchants that have the correct properties" do
    get :show, format: :json

    json_response.each do |merchant|
      assert merchant["name"]
    end
  end
end
