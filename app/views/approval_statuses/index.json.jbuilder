json.array!(@approval_statuses) do |approval_status|
  json.extract! approval_status, :id, :code, :details
  json.url approval_status_url(approval_status, format: :json)
end
