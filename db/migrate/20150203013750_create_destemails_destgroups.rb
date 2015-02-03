class CreateDestemailsDestgroups < ActiveRecord::Migration
  def change
    create_table :destemails_destgroups, id: false do |t|
      t.references :destemail, index: true, null: false
      t.references :destgroup, index: true, null: false
    end
  end
end
