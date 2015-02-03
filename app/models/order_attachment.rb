class OrderAttachment < ActiveRecord::Base
  mount_uploader :document, OrderUploader
  belongs_to :order
end
