class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :shipping_address_name, null: false
      t.string :shipping_address_address, null: false
      t.string :shipping_address_postal_code, null: false
      t.integer :postage, null: false
      t.string :payment_method, null: false
      t.integer :billing_amount, null: false
    end
  end
end
