class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page]).per(10)
  end

private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :billing_amount)
  end
end
