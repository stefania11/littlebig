# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create users
50.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password, bio: Faker::Lorem.sentences(2))
end

# Create prompts from users
100.times do
  User.find(rand(1..50)).prompts.create(body: Faker::Lorem.sentence, concept_list: Faker::Hacker.noun, character_list: Faker::Name.name)
end

# Respond to prompts
100.times do |n|
  rand_id = rand(1..100 + n)
  prompt = Prompt.find(rand_id)
  User.find(rand(1..50)).prompts.create(body: Faker::Lorem.sentence, source_id: rand_id)
  prompt.save
end
