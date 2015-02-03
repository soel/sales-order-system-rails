json.array!(@comment_attachments) do |comment_attachment|
  json.extract! comment_attachment, :id, :comment_id, :document
  json.url comment_attachment_url(comment_attachment, format: :json)
end
