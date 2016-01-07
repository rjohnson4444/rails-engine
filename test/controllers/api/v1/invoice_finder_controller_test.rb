require 'test_helper'

class Api::V1::InvoiceFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one invoice" do
    get :index, format: :json

    assert_equal Invoice.first.id, json_response["id"]
  end

  test "#index contains a invoice that has the correct properties" do
    get :index, format: :json

    assert json_response["id"]
    assert json_response["customer_id"]
    assert json_response["merchant_id"]
    assert json_response["status"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of invoices" do
    get :show, format: :json

    assert_equal Invoice.count, json_response.count
  end

  test "#show contains invoices that have the correct properties" do
    get :show, format: :json

    json_response.each do |invoice|
      assert invoice["customer_id"]
      assert invoice["merchant_id"]
      assert invoice["status"]
    end
  end
end
