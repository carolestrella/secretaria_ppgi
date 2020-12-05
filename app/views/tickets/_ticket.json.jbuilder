json.extract! ticket, :id, :data_entrada, :data_saida, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
