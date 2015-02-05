class CreateDestemails < ActiveRecord::Migration
  def change
    create_table :destemails do |t|
      t.string :email, unique: true

      t.timestamps
    end
  end
end
