class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  
  has_many :comment_attachments
  accepts_nested_attributes_for :comment_attachments
end
