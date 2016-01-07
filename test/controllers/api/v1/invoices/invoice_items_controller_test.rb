require 'test_helper'

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Invoice.first.id, format: :json

    assert_response :success
  end
end
