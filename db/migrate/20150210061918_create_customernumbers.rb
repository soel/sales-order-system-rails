class CreateCustomernumbers < ActiveRecord::Migration
  def change
    create_table :customernumbers do |t|
      t.integer :customer_num, unique: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
