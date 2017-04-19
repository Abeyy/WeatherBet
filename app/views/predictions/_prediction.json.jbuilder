json.extract! prediction, :id, :start, :end, :location_id, :created_at, :updated_at
json.url prediction_url(prediction, format: :json)