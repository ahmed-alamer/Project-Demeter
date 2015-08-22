json.array!(@bounties) do |bounty|
	json.GUID bounty.GUID
	json.grant bounty.grant.GUID
	json.amount bounty.amount
	json.receiver_wallet bounty.wallet.public_address
	json.url bounty_url(bounty, format: :json)
end
