require 'test_helper'

class Api::V1::TransactionFinderControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns a hash" do
    get :index, format: :json

    assert_kind_of Hash, json_response
  end

  test "#index returns one transaction" do
    get :index, format: :json

    assert_equal Transaction.first.id, json_response["id"]
  end

  test "#index contains a transaction that has the correct properties" do
    get :index, format: :json

    assert json_response["invoice_id"]
    assert json_response["credit_card_number"]
    assert json_response["result"]
  end

  test "#show responds to json" do
    get :show, format: :json

    assert_response :success
  end

  test "#show returns an array of records" do
    get :show, format: :json

    assert_kind_of Array, json_response
  end

  test "#show returns the correct number of transactions" do
    get :show, format: :json

    assert_equal Transaction.count, json_response.count
  end

  test "#show contains transactions that have the correct properties" do
    get :show, format: :json

    json_response.each do |transaction|
      assert transaction["invoice_id"]
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end
end
