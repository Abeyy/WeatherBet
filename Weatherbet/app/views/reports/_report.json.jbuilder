json.extract! report, :id, :start, :end, :location_id, :created_at, :updated_at
json.url report_url(report, format: :json)