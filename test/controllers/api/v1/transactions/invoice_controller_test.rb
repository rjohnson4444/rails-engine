require 'test_helper'

class Api::V1::Transactions::InvoiceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Transaction.first.id, format: :json

    assert_response :success
  end
end
