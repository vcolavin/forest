json.location do
  json.x @location.x
  json.y @location.y
  json.message "hey yo how ya"
  json.objects @location.objects do |object|
    json.thingie object.to_builder
  end
end