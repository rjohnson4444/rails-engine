require 'test_helper'

class Api::V1::InvoiceItems::ItemControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: InvoiceItem.first.id, format: :json

    assert_response :success
  end
end
