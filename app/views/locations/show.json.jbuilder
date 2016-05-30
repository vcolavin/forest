json.location do
  json.x @location.x
  json.y @location.y
  json.objects @location.objects do |object|
    kind = object.class.to_s.downcase
    json.(object, :kind, :name)
  end
end