require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index responds to json" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of transactions" do
    get :index, format: :json

    assert_equal Transaction.count, json_response.count
  end

  test "#index contains transactions that have the correct properties" do
    get :index, format: :json

    json_response.each do |transaction|
      assert transaction["invoice_id"]
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end

  test "#show responds to json" do
    get :show, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "#show returns one transaction" do
    get :show, format: :json, id: Transaction.first.id

    assert_kind_of Hash, json_response
  end

  test "#show returns the correct transaction" do
    get :show, format: :json, id: Transaction.first.id

    assert_equal Transaction.first.id, json_response["id"]
  end
end
