class GoldPurchasesController < ApplicationController
  before_action :set_gold_purchase, only: [:show, :update, :destroy]

  # GET /gold_purchases
  def index
    @gold_purchases = GoldPurchase.all

    render json: @gold_purchases
  end

  # GET /gold_purchases/1
  def show
    render json: @gold_purchase
  end

  # POST /gold_purchases
  def create
    price = gold_purchase_params[:price]
    amount = GoldPurchase.calculate_amount(price)
    @gold_purchase = GoldPurchase.new(user: current_user,
                                      amount: amount, price: price)

    if @gold_purchase.save
      render json: @gold_purchase, status: :created, location: @gold_purchase
    else
      render json: @gold_purchase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gold_purchases/1
  def update
    if @gold_purchase.update(gold_purchase_params)
      render json: @gold_purchase
    else
      render json: @gold_purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gold_purchases/1
  def destroy
    @gold_purchase.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gold_purchase
    @gold_purchase = GoldPurchase.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gold_purchase_params
    params.require(:gold_purchase).permit(:price)
  end
end
