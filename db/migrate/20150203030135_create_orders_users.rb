class CreateOrdersUsers < ActiveRecord::Migration
  def change
    create_table :orders_users, id: false do |t|
      t.references :order, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
