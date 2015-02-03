class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :contract_number
      t.integer :customer_number
      t.date :delivery_date
      t.string :status
      t.text :web_url
      t.text :order_comment

      t.timestamps
    end
  end
end
