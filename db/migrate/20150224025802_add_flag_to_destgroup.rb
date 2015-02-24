class AddFlagToDestgroup < ActiveRecord::Migration
  def change
    add_column :destgroups, :flag, :string
  end
end
