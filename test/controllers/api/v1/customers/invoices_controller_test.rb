require 'test_helper'

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase
  test "should get index" do
    binding.pry
    get :index
    assert_response :success
  end

end
