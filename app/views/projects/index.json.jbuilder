json.array!(@projects) do |project|
  json.extract! project, :id, :name, :nameplate, :address, :post_code, :country, :install_date
  json.url project_url(project, format: :json)
end
