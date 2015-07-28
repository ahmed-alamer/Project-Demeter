json.array!(@claimants) do |claimant|
  json.extract! claimant, :id, :name, :email, :address, :country
  json.url claimant_url(claimant, format: :json)
end
