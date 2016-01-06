require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "index return all invoices" do
    get :index

    assert_response :success
  end

  test "show returns specified invoices by id" do
    get :show, { id: "2" }

    assert_response :success
  end
end
