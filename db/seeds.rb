community_list = [

["Northwestern University", 0]

]

community_list.each do |name, communitytype|
  Community.create!( name: name, communitytype: communitytype )
end

#category list excluding tickets and textbooks (those are separte enum types of posts)
category_list = [

["Furniture", 0, "Chairs, futons, beds, etc. "],
["Clothes", 0, "Clothing "],
["Books", 0, "For school related books please change post type to Textbooks"],
["Art & Décor ", 0, "Posters, paintings, and other decorative items"],
["Kitchen", 0, "Silverware, plates, etc. "],
["Appliances ", 0, "A/C units, microwaves, fridges, and the like"],
["Electronic Accessories", 0, "Cases, chargers, and other peripherals"],
["Electronic Devices", 0, "Printers, headphones, cameras, misc."],
["TV & Gaming", 0, "Anything TV or gaming related"],
["Laptops & Computers", 0, "Laptops, monitors, and accessories like chargers"],
["Office/School Supplies", 0, "Pens, paper, notebooks, backpacks"],
["Miscellaneous Item", 0, "Any miscellaneous request or offer "],

["Tutoring", 1, "Tutoring requests or offers"],
["Research", 1, "Research requests or offers"],
["Photography", 1, "Requests for photographers….or subjects :D"],
["Miscellaneous Service", 1, "Any miscellaneous request or offer "],

]

category_list.each do |name, itemservice, description|
  Category.create!( name: name, itemservice: itemservice, description: description )
end


defaultcommunity = Community.find(1)

# example = User.find(1)
# category = Category.find(1)
# example.posts.create!(name: "Sample Title", description: "content")

# samplepost = Post.find(1)
# samplepost.categories << category


# #sample admin user
# User.create!(firstName:  "Example",
#              lastName:  "User",
#              email: "exampleuser20XX@u.northwestern.edu",
#              password:              "password",
#              password_confirmation: "password",
#              admin: true,
#              community: defaultcommunity,
#              activated: true,
#              activated_at: Time.zone.now)

# #fake users 
# 99.times do |n|
#   firstName  = Faker::Name.first_name
#   lastName  = Faker::Name.last_name
#   email = "example-#{n+1}@u.northwestern.edu"
#   password = "password"
#   User.create!(firstName:  firstName,
#                lastName:  lastName,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                community:  defaultcommunity,
#                activated: true,
#                activated_at: Time.zone.now)
# end

#fake posts of first six users to simulate activity 
users = User.order(:created_at).take(6)
50.times do |n|
  category = Category.find(n+1)
  content = Faker::Lorem.sentence(5)
  users.each { |user| 
    postt = user.posts.create!(name: "Sample Title", description: content) 
    postt.categories << category }
end
