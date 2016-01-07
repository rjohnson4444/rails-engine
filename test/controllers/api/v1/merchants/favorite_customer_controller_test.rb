require 'test_helper'

class Api::V1::Merchants::FavoriteCustomerControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: Customer.first.id, format: :json
    assert_response :success
  end

end
