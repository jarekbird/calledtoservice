json.extract! service_request, :id, :requester_first_name, :requester_last_name, :receiver_first_name, :receiver_last_name, :user_id, :service_needed, :comments, :date1, :date2, :created_at, :updated_at
json.url service_request_url(service_request, format: :json)
