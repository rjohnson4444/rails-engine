require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "index return all invoice items" do
    skip
    get :index

    assert_response :success
  end
end
