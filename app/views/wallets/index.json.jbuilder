json.array!(@wallets) do |wallet|
  json.extract! wallet, :id, :public_address, :project_id
  json.url wallet_url(wallet, format: :json)
end
