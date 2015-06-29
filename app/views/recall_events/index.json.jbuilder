json.array!(@recall_events) do |recall_event|
  json.extract! recall_event, :id
  json.url recall_event_url(recall_event, format: :json)
end
