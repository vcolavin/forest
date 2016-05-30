json.location do
  json.x @location.x
  json.y @location.y
  json.objects @location.objects do |object|
    json.(object, :kind, :name)
  end
end