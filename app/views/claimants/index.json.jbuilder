json.array!(@claimants) do |claimant|
  json.extract! claimant, :id, :name, :emai, :address, :country
  json.url claimant_url(claimant, format: :json)
end
