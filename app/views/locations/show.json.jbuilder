json.location do
  json.x(@location.x)
  json.y(@location.y)

  json.objects do
    object_attributes = @location.objects.map {|object| object.to_builder.attributes!}

    json.array!(object_attributes)
  end
end