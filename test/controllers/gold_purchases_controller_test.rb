require 'test_helper'

class GoldPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gold_purchase = gold_purchases(:one)
  end

  test "should get index" do
    get gold_purchases_url, as: :json
    assert_response :success
  end

  test "should create gold_purchase" do
    assert_difference('GoldPurchase.count') do
      post gold_purchases_url, params: { gold_purchase: { gold_ledger_entry_id: @gold_purchase.gold_ledger_entry_id, price_currency: @gold_purchase.price_currency, price_pesewas: @gold_purchase.price_pesewas, sending_phone: @gold_purchase.sending_phone, transaction_flow: @gold_purchase.transaction_flow } }, as: :json
    end

    assert_response 201
  end

  test "should show gold_purchase" do
    get gold_purchase_url(@gold_purchase), as: :json
    assert_response :success
  end

  test "should update gold_purchase" do
    patch gold_purchase_url(@gold_purchase), params: { gold_purchase: { gold_ledger_entry_id: @gold_purchase.gold_ledger_entry_id, price_currency: @gold_purchase.price_currency, price_pesewas: @gold_purchase.price_pesewas, sending_phone: @gold_purchase.sending_phone, transaction_flow: @gold_purchase.transaction_flow } }, as: :json
    assert_response 200
  end

  test "should destroy gold_purchase" do
    assert_difference('GoldPurchase.count', -1) do
      delete gold_purchase_url(@gold_purchase), as: :json
    end

    assert_response 204
  end
end
