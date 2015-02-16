class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :contract_number, null: false
      t.integer :customer_number, null: false
      t.date :delivery_date
      t.string :status, null: false
      t.text :web_url
      t.text :order_comment

      t.timestamps
    end
  end
end
