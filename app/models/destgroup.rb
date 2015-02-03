class Destgroup < ActiveRecord::Base
  has_and_belongs_to_many :destemails
  has_and_belongs_to_many :orders
end
