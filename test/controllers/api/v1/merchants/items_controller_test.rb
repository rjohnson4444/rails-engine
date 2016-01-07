require 'test_helper'

class Api::V1::Merchants::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Merchant.first.id, format: :json

    assert_response :success
  end
end
