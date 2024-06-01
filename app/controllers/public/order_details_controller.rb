class Public::OrderDetailsController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  private
  
  def customer_params
    params.rewuire(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :encrypted)
  end
end
