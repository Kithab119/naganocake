class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :shipping_postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :postage, null: false
      t.integer :claim, null: false
      t.integer :payment, default: 0, null: false
      t.integer :is_receive, default: 0, null: false
      t.timestamps #created_at, updated_atが自動生成
    end
  end
end
