json.array!(@comment_templates) do |comment_template|
  json.extract! comment_template, :id, :name, :body
  json.url comment_template_url(comment_template, format: :json)
end
