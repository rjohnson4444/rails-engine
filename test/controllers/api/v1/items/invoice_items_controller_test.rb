require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: Item.first.id, format: :json
    
    assert_response :success
  end
end
