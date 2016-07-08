json.location do
  json.x(@location_presenter.x)
  json.y(@location_presenter.y)

  json.actions(@location_presenter.actions)

  json.objects do
    json.array!(@location_presenter.object_attributes)
  end
end
