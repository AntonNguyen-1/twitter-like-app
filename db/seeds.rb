# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times.each do |i|
  user = User.create!(email: "user-#{i+1}@gmail.com", password: 'user123')
  Tweet.create!(title: "Tweet title ##{i+1}", body: "Some text suddenly appeared right here", user_id: user[:id])
end