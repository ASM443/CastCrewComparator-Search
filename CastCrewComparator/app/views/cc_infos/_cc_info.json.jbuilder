json.extract! cc_info, :id, :name, :picture, :knownFor, :created_at, :updated_at
json.url cc_info_url(cc_info, format: :json)
