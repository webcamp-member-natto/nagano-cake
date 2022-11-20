class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postal_code, null: false
      t.integer :order_status, null: false, default:0
      t.integer :payment_method, null: false, default:0
      t.integer :postage, null: false
      t.integer :price , null: false

      t.timestamps
    end
  end
end
