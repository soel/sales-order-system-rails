class Customernumber < ActiveRecord::Base
  validates :customer_num, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
