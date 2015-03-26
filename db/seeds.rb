require 'faker'

# Create Users
5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save!
end
users = User.all

# Create admin user
admin = User.new(
  email:    "admin@example.com",
  password: "helloworld"
  )
admin.save!

# Create Page Visits
50.times do
  @user = users.sample
  Event.create!(
    name: "page_visit",
    website: "http://localhost:3000",
    property_1: 1,
    property_2: Faker::Lorem.word,
    url: Faker::Internet.url("localhost:3000"),
    user_id: @user.id,
    created_at: Faker::Time.between(300.days.ago, Time.now)
  )
end

# Page Visits for Admin User's App
50.times do
  @user = admin
  Event.create!(
    name: "page_visit",
    website: "http://localhost:3000",
    url: Faker::Internet.url("localhost:3000"),
    user_id: @user.id,
    created_at: Faker::Time.between(300.days.ago, Time.now)
  )
end

# Clicks for Admin User's App
50.times do
  @user = admin
  Event.create!(
    name: "click",
    website: "http://localhost:3000",
    property_1: Faker::Lorem.word,
    property_2: Faker::Lorem.word,
    url: Faker::Internet.url("localhost:3000"),
    user_id: @user.id,
    created_at: Faker::Time.between(300.days.ago, Time.now)
  )
end
events = Event.all


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
