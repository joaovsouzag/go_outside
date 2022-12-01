# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" , { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!( email: "david@hotmail.com" , password: "123456" , username: "david" , birthdate: "15/11/2000")
User.create!( email: "joao@hotmail.com" , password: "123456" , username: "joao" , birthdate: "25/08/1935")
User.create!( email: "barbara@hotmail.com" , password: "123456" , username: "barbara" , birthdate: "30/12/1945")
User.create!( email: "gabigol@hotmail.com" , password: "123456" , username: "gabriel" , birthdate: "24/12/2000")

Location.create!( address: "R. Gomes Carneiro, 32 - Ipanema, Rio de Janeiro - RJ, 22261-004" , name: "Spoleto" , location_type: "Night Club")
Location.create!( address: "R. Teixeira de Melo, 21 - Loja: A - Ipanema, Rio de Janeiro - RJ, 22410-010" , name: "B, de Burger" , location_type: "Bar")
Location.create!( address: "R. Farme de Amoedo, 39 - Ipanema, Rio de Janeiro - RJ, 22420-020" , name: "Balada Mix" , location_type: "Night Club")
Location.create!( address: "R. Farme de Amoedo, 75 - Ipanema, Rio de Janeiro - RJ, 22420-020" , name: "Koni" , location_type: "Bar")

Feedback.create!( user_id: "1" , location_id: "4" , comment: "ashfkjhasjfhkjhasf" , rating: "2")
Feedback.create!( user_id: "2" , location_id: "3" , comment: "afhgjkahskjfhjkahs" , rating: "4")
Feedback.create!( user_id: "3" , location_id: "2" , comment: "afhjksbkjfbadkjbfa" , rating: "3")
Feedback.create!( user_id: "4" , location_id: "1" , comment: "afhjksbhfkjhajkfjf" , rating: "5")

Favorite.create!( user_id: "1" , location_id: "4")
Favorite.create!( user_id: "2" , location_id: "3")
Favorite.create!( user_id: "3" , location_id: "2")
Favorite.create!( user_id: "4" , location_id: "1")

CheckIn.create!( user_id: "1" , location_id: "4")
CheckIn.create!( user_id: "2" , location_id: "3")
CheckIn.create!( user_id: "3" , location_id: "2")
CheckIn.create!( user_id: "4" , location_id: "1")


# require "open-uri"
# require "yaml"

# file = "https://gist.githubusercontent.com/dmilon/e897669bfa411bfdd92c9f59f91dd6fe/raw/d1e1b06e25616771fddf44bf066765f518b0655d/imdb.yml"
# sample = YAML.load(URI.open(file).read)

# puts "Creating users..."
# users = {}  # slug => Userr
# sample["users"].each do |user|
#   users[user["slug"]] = User.create! user.slice("email", "password", "birth_date", "username", "avatar")
# end

# puts "Creating feedbacks..."
# users = {}  # slug => Userr
# sample["feedbacks"].each do |feedback|
#   feedbacks[feedback["slug"]] = Feedback.create! feedback.slice("user_id", "location_id", "photo", "video", "comment", "rating")
# end

# puts "Creating checkins..."
# users = {}  # slug => Userr
# sample["checkins"].each do |checkin|
#   checkins[checkin["slug"]] = Checkin.create! checkin.slice("user_id", "location_id")
# end

# puts "Creating locations..."
# users = {}  # slug => Userr
# sample["locations"].each do |location|
#   locations[location["slug"]] = Location.create! location.slice("address", "name", "location_type", "photo")
# end

# puts "Creating favorites..."
# users = {}  # slug => Userr
# sample["favorites"].each do |favorite|
#   favorites[favorite["slug"]] = Favorite.create! favorite.slice("user_id", "location_id")
# end
