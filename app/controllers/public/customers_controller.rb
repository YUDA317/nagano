class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(current_user.id)
  end
  
  def update
  end
end