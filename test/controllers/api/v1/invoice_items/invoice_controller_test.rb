require 'test_helper'

class Api::V1::InvoiceItems::InvoiceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: InvoiceItem.last.id, format: :json

    assert_response :success
  end
end
