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

Location.create!( address: "Gavea", name: "Bosque Bar", location_type: "Night Club", photos: "https://www.bing.com/images/search?view=detailV2&ccid=ZW8elOux&id=B4004E35781E72C26242CE3CF6275CE5C5975315&thid=OIP.ZW8elOuxO0Ucg4JMLflf2AHaEK&mediaurl=https%3a%2f%2fstatic.wixstatic.com%2fmedia%2fec091c_9875f2daaf3b4c788657860b7886747c%7emv2.jpg%2fv1%2ffill%2fw_980%2ch_551%2cal_c%2cq_85%2cusm_0.66_1.00_0.01%2fec091c_9875f2daaf3b4c788657860b7886747c%7emv2.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.656f1e94ebb13b451c83824c2df95fd8%3frik%3dFVOXxeVcJ%252fY8zg%26pid%3dImgRaw%26r%3d0&exph=551&expw=980&q=bosque+bar+logo+gavea&simid=607990189379174431&FORM=IRPRST&ck=BB3DE0C6B0C0EB864FB96D89175B0771&selectedIndex=3" )
Location.create!( address: "Barra da Tijuca", name: "Vitrini", location_type: "Night Club",photos: "https://www.bing.com/images/search?view=detailV2&ccid=m0feW37X&id=0E57F220A750A1E42F9C4858D51F7FAC18239269&thid=OIP.m0feW37Xjs-gC5-6biAfkwAAAA&mediaurl=https%3a%2f%2frioallaccess.com%2fwp-content%2fuploads%2fVitrini-Lounge-1_289x289_acf_cropped.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.9b47de5b7ed78ecfa00b9fba6e201f93%3frik%3daZIjGKx%252fH9VYSA%26pid%3dImgRaw%26r%3d0&exph=289&expw=289&q=vitrini+lounge+club+logo&simid=608010835277532976&FORM=IRPRST&ck=256A4D70A3052E5E1F6863D8BEF7D165&selectedIndex=0")
Location.create!( address: "Copacabana", name: "Belmonte", location_type: "Bar", photos: "https://www.bing.com/images/search?view=detailV2&ccid=X%2bRZIN40&id=B35EE5A23BE49BEAA12715181EF935382D688DB1&thid=OIP.X-RZIN40kHLUrp9SUjrUYgHaC3&mediaurl=https%3a%2f%2fcardapioseguro.com.br%2fbelmonte-ipanema%2fwp-content%2fuploads%2f2020%2f07%2flogo-full-e1593746952107.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.5fe45920de349072d4ae9f52523ad462%3frik%3dsY1oLTg1%252bR4YFQ%26pid%3dImgRaw%26r%3d0&exph=213&expw=550&q=belmonte+ipanema+logo&simid=608032868454178688&FORM=IRPRST&ck=CEAA7E3C277C3D071FB97C0DE448056C&selectedIndex=0")
Location.create!( address: "Barra da Tijuca", name: "All In", location_type: "Night Club", photos: "data:image/jpeg;base64,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")
Location.create!( address: "Botafogo", name: "Rosa de Ouro", location_type: "Bar", photos: "https://www.bing.com/ck/a?!&&p=54fe4750b77474a9JmltdHM9MTY2OTkzOTIwMCZpZ3VpZD0zMzRhMjUxNS05ODdhLTY2NDktMjBlZi0zNzcwOTkyYjY3YjMmaW5zaWQ9NTQ4Nw&ptn=3&hsh=3&fclid=334a2515-987a-6649-20ef-3770992b67b3&u=a1L2ltYWdlcy9zZWFyY2g_cT1Sb3NhJTIwZGUlMjBPdXJvJTIwQmFyJTIwTG9nbyZGT1JNPUlRRlJCQSZpZD0zMzJGMDNBQTlBQzcyM0Q4RkU1MDdGNDIwN0ZDNjBGNjZDMjAzOTVE&ntb=1")

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
