require 'test_helper'

class Api::V1::Items::MerchantControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
