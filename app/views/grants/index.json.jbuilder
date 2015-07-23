json.array!(@grants) do |grant|
  json.extract! grant, :id, :entry_date, :approval_code, :amount, :project_id, :receiver_wallet
  json.url grant_url(grant, format: :json)
end
