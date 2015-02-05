class Destemail < ActiveRecord::Base
  has_and_belongs_to_many :destgroups
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
