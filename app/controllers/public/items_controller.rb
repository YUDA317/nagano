class Public::ItemsController < ApplicationController
  before_action :amount, only: [:new, :create]
  
  def amount
    @amount = Amount.all
  end
  
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
