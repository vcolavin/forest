# locations
10.times do |x|
  10.times do |y|
    Location.create(x_coordinate: x + 1, y_coordinate: y + 1)
  end
end

# wolves and trees
50.times do |i|
  location = Location.limit(1).order("RANDOM()").first
  Wolf.create(name: "wolf #{i}", location: location)
  Rabbit.create(location: location)
  Tree.create(number_of_branches: i, location: location)
end
