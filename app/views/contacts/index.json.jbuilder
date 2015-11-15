json.array!(@contacts) do |contact|
  json.extract! contact, :id, :salutation, :first_name, :last_name, :street, :apt, :city, :state, :zip
  json.url contact_url(contact, format: :json)
end
