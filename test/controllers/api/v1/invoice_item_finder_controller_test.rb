require 'test_helper'

class Api::V1::InvoiceItemFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one invoice_item" do
    get :index, format: :json

    assert_equal InvoiceItem.first.id, json_response["id"]
  end

  test "#index contains a invoice_item that has the correct properties" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["item_id"]
    assert json_response["invoice_id"]
    assert json_response["quantity"]
    assert json_response["unit_price"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of invoice_items" do
    get :show, format: :json

    assert_equal InvoiceItem.count, json_response.count
  end

  test "#show contains invoice_items that have the correct properties" do
    get :show, format: :json

    json_response.each do |invoice_item|
      assert invoice_item["item_id"]
      assert invoice_item["invoice_id"]
      assert invoice_item["quantity"]
      assert invoice_item["unit_price"]
    end
  end
end
