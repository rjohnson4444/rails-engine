require 'test_helper'

class Api::V1::Invoices::CustomerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
