class Destemail < ActiveRecord::Base
  has_and_belongs_to_many :destgroups
end
