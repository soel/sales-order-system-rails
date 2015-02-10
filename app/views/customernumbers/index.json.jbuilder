json.array!(@customernumbers) do |customernumber|
  json.extract! customernumber, :id, :customer_num, :name
  json.url customernumber_url(customernumber, format: :json)
end
