# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# create friends

require 'faker'

User.destroy_all

10.times do
  User.create!({
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "test2017",
    password_confirmation: "test2017"
   })
end

User.all.each do |user|
  3.times do
    user.add_friend(User.all[rand(User.count)])
  end
end
