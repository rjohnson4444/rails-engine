require 'test_helper'

class Api::V1::ItemFinderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    
    assert_response :success
  end
end
