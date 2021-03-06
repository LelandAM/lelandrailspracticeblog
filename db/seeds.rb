# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times {
  Post.create!(
    title: Faker::Lorem.sentence(5),
    body: Faker::Lorem.paragraph(3),
    author_id: rand(1..10),
  )
}

10.times {
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: 'password',
  )
}

# 20.times {
#   Comment.create!(
#     name: Faker::Internet.user_name,
#     body: Faker::Hacker.say_something_smart,
#     post: rand(1..20),
#   )
# }