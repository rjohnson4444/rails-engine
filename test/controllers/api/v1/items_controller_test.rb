require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "index return all items" do
    skip
    get :index

    assert_response :success
  end
end
