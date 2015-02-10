class CreateCustomernumbers < ActiveRecord::Migration
  def change
    create_table :customernumbers do |t|
      t.integer :customer_num, unique: true
      t.string :name

      t.timestamps
    end
  end
end
