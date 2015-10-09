json.array!(@wallets) do |wallet|
  json.extract! wallet, :id, :public_address, :tag, :claimant_id
  json.url wallet_url(wallet, format: :json)
end
