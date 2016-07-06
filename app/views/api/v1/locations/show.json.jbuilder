json.location do
  json.x(@location_presenter.x)
  json.y(@location_presenter.y)

  json.actions do
    # TODO: these need to not render the key if the direction does not exist.
    # where does this logic live?
    json.north(@location_presenter.north_url)
    json.south(@location_presenter.south_url)
    json.east(@location_presenter.east_url)
    json.west(@location_presenter.west_url)
  end

  json.objects do
    json.array!(@location_presenter.object_attributes)
  end
end
