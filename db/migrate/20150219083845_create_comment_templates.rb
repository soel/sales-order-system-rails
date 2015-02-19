class CreateCommentTemplates < ActiveRecord::Migration
  def change
    create_table :comment_templates do |t|
      t.string :name, unique: true, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
