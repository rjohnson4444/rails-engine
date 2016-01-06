require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "index return all merchants" do
    skip
    get :index, format: :json

    assert_response :success
  end
end
