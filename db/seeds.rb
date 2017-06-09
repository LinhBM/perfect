# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create name: "food"
Category.create name: "fast"

OrderStatus.create name: "In Progress"
OrderStatus.create name: "Placed"
OrderStatus.create name: "Shipped"
OrderStatus.create name: "Cancelled"

User.create username: "admin", email: "admin@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456", role: "admin"
User.create username: "manh", email: "manh@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456"
User.create username: "linh", email: "linh@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456"
