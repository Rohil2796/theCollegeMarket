User.create!(firstName:  "Example",
             lastName:  "User",
             email: "exampleuser20XX@u.northwestern.edu",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  firstName  = Faker::Name.first_name
  lastName  = Faker::Name.last_name
  email = "example-#{n+1}@u.northwestern.edu"
  password = "password"
  User.create!(firstName:  firstName,
               lastName:  lastName,
               email: email,
               password:              password,
               password_confirmation: password)
end