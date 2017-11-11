json.extract! confirmation, :id, :flight_arrival_number, :flight_arrival_date, :flight_arrival_hours, :flight_return_number, :date_of_return_flight, :return_flight_hours, :hijab, :dress_size, :script, :arrival_ticket, :return_ticket, :user_id, :created_at, :updated_at
json.url confirmation_url(confirmation, format: :json)
