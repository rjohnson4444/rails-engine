require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of invoice" do
    get :index, format: :json

    assert_equal Invoice.count, json_response.count
  end

  test "#index contains invoices that have the correct properties" do
    get :index, format: :json

    json_response.each do |invoice|
      assert invoice["customer_id"]
      assert invoice["merchant_id"]
      assert invoice["status"]
    end
  end

  test "#show responds to json" do
    get :show, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#show returns one invoice" do
    get :show, format: :json, id: Invoice.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct invoice" do
    get :show, format: :json, id: Invoice.first.id

    assert_equal Invoice.first.id, json_response["id"]
  end
end
