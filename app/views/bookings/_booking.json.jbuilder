json.extract! booking, :id, :data_entrada, :data_saida, :created_at, :updated_at
json.url booking_url(booking, format: :json)
