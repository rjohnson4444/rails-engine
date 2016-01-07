require 'test_helper'

class Api::V1::MerchantRevenueControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end
end
