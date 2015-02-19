class CommentTemplate < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
