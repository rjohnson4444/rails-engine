require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase
  test "should get index" do
    get :show, id: Merchant.first.id, format: :json
    
    assert_response :success
  end
end
