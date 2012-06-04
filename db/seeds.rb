# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

colors = [[226, 255, 230, 'green'],[242, 240, 223,'tan'],[255, 239, 211,'light brown'],[208, 236, 234,'blue'],[194, 210, 207,'gray']]

colors.each do |color|
  next if color.size != 4
  red = color[0]
  green = color[1]
  blue = color[2]
  name = color[3]
  puts "Red: #{red} Green: #{green} Blue: #{blue} Name: #{name}"
  Color.create(red: red, green: green, blue: blue, name: name)
end
# Color.create(red: 0, green: 0, blue: 0, name: "SupaDark")
# Color.create(red: 226, green: 255, blue: 230, name: "SupaBright")
# Category.create(name: 'work', user_id: 1, color_id: 2)