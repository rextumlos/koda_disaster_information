# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(category: "COVID")
Category.create(category: "Earthquake")
Category.create(category: "Requirements")

User.create(email:"disaster_forum@gmail.com", password: "password", password_confirmation: "password")
3.times do
  User.create(email:"#{Faker::Name.first_name_neutral.downcase}#{Faker::Name.last_name.downcase}@gmail.com", password: "password", password_confirmation: "password")
end

10.times do
  category = Category.all.sample
  post = Post.create(
    user: User.first,
    category_ids: [category.id],
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    address: Faker::Address.full_address,
  )

  rand(5..20).times do
    post.comments.create(
      user: User.all.sample,
      content: Faker::Lorem.paragraph
    )
  end
end