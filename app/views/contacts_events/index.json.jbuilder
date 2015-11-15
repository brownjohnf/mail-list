json.array!(@contact_events) do |contact_event|
  json.extract! contact_event, :id, :contact_id, :event_id
  json.url contact_event_url(contact_event, format: :json)
end
