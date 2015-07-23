json.array!(@bounties) do |bounty|
  json.extract! bounty, :id, :GUID, :entry_date, :amount, :receiver_wallet, :grant_id
  json.url bounty_url(bounty, format: :json)
end
