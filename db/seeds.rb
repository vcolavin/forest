# locations
10.times do |x|
  10.times do |y|
    location = Location.create(x_coordinate: x + 1, y_coordinate: y + 1)

    if location.save
      puts "location created at #{location.x}, #{location.y}."
    end
  end
end

# wolves and trees
5.times do |i|
  # TODO: ASSOCIATE THESE LIKE THIS: location: Location.random or something
  wolf = Wolf.create(name: "wolf #{i}")
  tree = Tree.create(number_of_branches: i)
end
