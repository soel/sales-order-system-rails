json.array!(@order_attachments) do |order_attachment|
  json.extract! order_attachment, :id, :order_id, :document
  json.url order_attachment_url(order_attachment, format: :json)
end
