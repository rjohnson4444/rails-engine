require 'test_helper'

class Api::V1::Merchants::CustomersWithPendingInvoicesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: Merchant.first.id, format: :json

    assert_response :success
  end
end
