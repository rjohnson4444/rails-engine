require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "index return all items" do
    get :index

    assert_response :success
  end

  test "show returns specified item by id" do
    get :show, { id: "2" }

    assert_response :success
  end
end
