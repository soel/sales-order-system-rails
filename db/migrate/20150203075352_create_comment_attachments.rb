class CreateCommentAttachments < ActiveRecord::Migration
  def change
    create_table :comment_attachments do |t|
      t.integer :comment_id
      t.string :document

      t.timestamps
    end
  end
end
