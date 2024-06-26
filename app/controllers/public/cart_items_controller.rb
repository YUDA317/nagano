class Public::CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page])
    @cart_items = CartItem.page(params[:page])
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
