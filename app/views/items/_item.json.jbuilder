json.extract! item, :id, :name, :value, :weight, :location, :created_at, :updated_at, :comments
json.url item_url(item, format: :json)
