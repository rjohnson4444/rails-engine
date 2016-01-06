require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "index return all invoices" do
    skip
    get :index

    assert_response :success
  end
end
