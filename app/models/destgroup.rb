class Destgroup < ActiveRecord::Base
  has_and_belongs_to_many :destemails
  has_and_belongs_to_many :orders
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
