class CreateDestemails < ActiveRecord::Migration
  def change
    create_table :destemails do |t|
      t.string :email

      t.timestamps
    end
  end
end
