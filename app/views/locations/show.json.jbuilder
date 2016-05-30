json.location do
  json.x @location.x
  json.y @location.y

  json.objects do
    json.array! @location.objects.map {|object| object.to_builder.attributes!}
    # json.array! @location.objects.map do |object|
    #   object.to_builder.attributes!
    # end
  end
end