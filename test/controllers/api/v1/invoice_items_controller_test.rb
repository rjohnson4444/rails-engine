require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "index return all invoice items" do
    get :index

    assert_response :success
  end

  test "show returns specified invoice item by id" do
    get :show, { id: "2" }

    assert_response :success
  end
end
