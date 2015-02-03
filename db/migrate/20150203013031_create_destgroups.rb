class CreateDestgroups < ActiveRecord::Migration
  def change
    create_table :destgroups do |t|
      t.string :name

      t.timestamps
    end
  end
end
