require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" , { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!( email: "david@hotmail.com" , password: "123456" , username: "david" , birthdate: "15/11/2000")
# User.create!( email: "joao@hotmail.com" , password: "123456" , username: "joao" , birthdate: "25/08/1935")
# User.create!( email: "barbara@hotmail.com" , password: "123456" , username: "barbara" , birthdate: "30/12/1945")
# User.create!( email: "gabigol@hotmail.com" , password: "123456" , username: "gabriel" , birthdate: "24/12/2000")

# Location.create!( address: "R. Gomes Carneiro, 32 - Ipanema, Rio de Janeiro - RJ, 22261-004" , name: "Spoleto" , location_type: "Night Club")
# Location.create!( address: "R. Teixeira de Melo, 21 - Loja: A - Ipanema, Rio de Janeiro - RJ, 22410-010" , name: "B, de Burger" , location_type: "Bar")
# Location.create!( address: "R. Farme de Amoedo, 39 - Ipanema, Rio de Janeiro - RJ, 22420-020" , name: "Balada Mix" , location_type: "Night Club")
# Location.create!( address: "R. Farme de Amoedo, 75 - Ipanema, Rio de Janeiro - RJ, 22420-020" , name: "Koni" , location_type: "Bar")


# Feedback.create!( user_id: "1" , location_id: "4" , comment: "ashfkjhasjfhkjhasf" , rating: "2")
# Feedback.create!( user_id: "2" , location_id: "3" , comment: "afhgjkahskjfhjkahs" , rating: "4")
# Feedback.create!( user_id: "3" , location_id: "2" , comment: "afhjksbkjfbadkjbfa" , rating: "3")
# Feedback.create!( user_id: "4" , location_id: "1" , comment: "afhjksbhfkjhajkfjf" , rating: "5")

# Favorite.create!( user_id: "1" , location_id: "4")
# Favorite.create!( user_id: "2" , location_id: "3")
# Favorite.create!( user_id: "3" , location_id: "2")
# Favorite.create!( user_id: "4" , location_id: "1")



# CheckIn.create!( user_id: "1" , location_id: "4")
# CheckIn.create!( user_id: "2" , location_id: "3")
# CheckIn.create!( user_id: "3" , location_id: "2")
# CheckIn.create!( user_id: "4" , location_id: "1")



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

require "open-uri"
require "net/http"
require "json"

puts "cleaning DB"
Feedback.destroy_all
CheckIn.destroy_all
Favorite.destroy_all
Message.destroy_all
Chatroom.destroy_all
Location.destroy_all

puts "pushing night clubs locations RJ"
url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=night_clubs%20in%20Rio%20de%20janeiro&key=#{ENV['GOOGLE_KEY']}"
user_serialized = URI.open(url).read
night_clubs = JSON.parse(user_serialized)
night_clubs["results"].each do |nc|
  url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{nc["place_id"]}&fields=name%2Cformatted_address&key=#{ENV['GOOGLE_KEY']}"
  place = URI.open(url).read
  clubs = JSON.parse(place)
  @client = GooglePlaces::Client.new("#{ENV['GOOGLE_KEY']}")
  if @client.spot("#{nc["place_id"]}").photos != []
    @spot = @client.spot("#{nc["place_id"]}")
    url = @spot.photos[0].fetch_url(800)
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Night Club", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: url)
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  else
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Night Club", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: "https://upload.wikimedia.org/wikipedia/commons/3/32/Wikipedia_space_ibiza%2803%29.jpg")
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  end
end

puts "pushing bars locations RJ"

url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars%20in%20Rio%20de%20janeiro&key=#{ENV['GOOGLE_KEY']}"
user_serialized = URI.open(url).read
night_clubs = JSON.parse(user_serialized)
night_clubs["results"].each do |nc|
  url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{nc["place_id"]}&fields=name%2Cformatted_address&key=#{ENV['GOOGLE_KEY']}"
  place = URI.open(url).read
  clubs = JSON.parse(place)
  @client = GooglePlaces::Client.new("#{ENV['GOOGLE_KEY']}")
  if @client.spot("#{nc["place_id"]}").photos != []
    @spot = @client.spot("#{nc["place_id"]}")
    url = @spot.photos[0].fetch_url(800)
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Bar", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: url)
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  else
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Bar", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: "https://www.emporiotambo.com.br/pub/media/resized/1300x800/ves/blog/xdecoracao.png.pagespeed.ic.R8VcjUk_QU.jpg")
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  end
end
puts "pushing night clubs locations SP"
url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=night_clubs%20in%20sao%20paulo&key=#{ENV['GOOGLE_KEY']}"
user_serialized = URI.open(url).read
night_clubs = JSON.parse(user_serialized)
night_clubs["results"].each do |nc|
  url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{nc["place_id"]}&fields=name%2Cformatted_address&key=#{ENV['GOOGLE_KEY']}"
  place = URI.open(url).read
  clubs = JSON.parse(place)
  @client = GooglePlaces::Client.new("#{ENV['GOOGLE_KEY']}")
  if @client.spot("#{nc["place_id"]}").photos != []
    @spot = @client.spot("#{nc["place_id"]}")
    url = @spot.photos[0].fetch_url(800)
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Night Club", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: url)
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  else
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Night Club", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: "https://www.emporiotambo.com.br/pub/media/resized/1300x800/ves/blog/xdecoracao.png.pagespeed.ic.R8VcjUk_QU.jpg")
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  end
end

puts "pushing bars locations SP"
url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars%20in%20sao%20paulo&key=#{ENV['GOOGLE_KEY']}"
user_serialized = URI.open(url).read
night_clubs = JSON.parse(user_serialized)
night_clubs["results"].each do |nc|
  url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{nc["place_id"]}&fields=name%2Cformatted_address&key=#{ENV['GOOGLE_KEY']}"
  place = URI.open(url).read
  clubs = JSON.parse(place)
  @client = GooglePlaces::Client.new("#{ENV['GOOGLE_KEY']}")
  if @client.spot("#{nc["place_id"]}").photos != []
    @spot = @client.spot("#{nc["place_id"]}")
    url = @spot.photos[0].fetch_url(800)
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Bar", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: url)
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  else
    location_new = Location.create!(address: clubs["result"]["formatted_address"], name: clubs["result"]["name"], location_type: "Bar", latitude: nc["geometry"]["location"]["lat"], longitude: nc["geometry"]["location"]["lng"], photos: "https://www.emporiotambo.com.br/pub/media/resized/1300x800/ves/blog/xdecoracao.png.pagespeed.ic.R8VcjUk_QU.jpg")
    chatroom_new = Chatroom.new(name: location_new.name, location: location_new)
    chatroom_new.save!
  end
end
puts "finished"
