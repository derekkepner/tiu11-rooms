json.extract! reservation, :id, :room_id, :customer_name, :start_time, :end_time, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
