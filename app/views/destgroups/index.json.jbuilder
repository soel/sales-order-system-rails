json.array!(@destgroups) do |destgroup|
  json.extract! destgroup, :id, :name
  json.url destgroup_url(destgroup, format: :json)
end
