require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "index return all merchants" do
    get :index

    assert_response :success
  end

  test "show returns specified merchant by id" do
    get :show, { id: "2" }

    assert_response :success
  end
end
