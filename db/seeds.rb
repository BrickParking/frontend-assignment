# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(name: 'User 1', email: 'user1@test.rb', password: 'test', password_confirmation: 'test')
User.create(name: 'User 2', email: 'user2@test.rb', password: 'test', password_confirmation: 'test')
User.create(name: 'User 3', email: 'user3@test.rb', password: 'test', password_confirmation: 'test')
User.all.each { |user| puts "\n Created user #{user.email}, password: test" }
