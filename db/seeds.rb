# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Category.destroy_all
# categories = Category.create([{ title: 'Book' }, { title: 'Magazine' }, { title: 'Manga' }])

# Product.destroy_all
=begin
10.times do |x|
  Product.create(
    title: "Book title #{+x}",
    description: "Books descr #{+x}",
    price: rand(1..100),
    category_id: 1
  )
end

10.times do |x|
  Product.create(
    title: "Magazine title #{+x}",
    description: "Magazine descr #{+x}",
    price: rand(1..77),
    category_id: 2
  )
end

10.times do |x|
  Product.create(
    title: "Manga title #{+x}",
    description: "Manga descr #{+x}",
    price: rand(1..20),
    category_id: 3
  )
end
=end
# p "Created #{Category.count} categories entries."
# p "Created #{Product.count} products entries."

if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'Password1', admin: true])
  p "Admin created: #{User.count}"
else
  p 'User already exist'
end