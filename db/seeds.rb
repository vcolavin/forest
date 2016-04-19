10.times do |x|
  10.times do |y|
    location = Location.create(x_coordinate: x + 1, y_coordinate: y + 1)

    if location.save
      puts "location created at #{location.x}, #{location.y}."
    end
  end
end