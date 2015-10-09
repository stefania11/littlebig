# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create users
75.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password, bio: Faker::Company.catch_phrase)
end

# Create prompts from users
100.times do
  User.find(rand(1..75)).prompts.create(body: Faker::Hacker.say_something_smart, concept_list: Bazaar.object, character_list: Faker::Name.name)
end

# Add overviews & bios
1.upto(100) do |n|
  concept = Concept.find(n)
  concept.overview = Faker::Company.bs
  concept.save

  character = Character.find(n)
  character.bio = Faker::Company.catch_phrase
  character.save
end

# Respond to prompts
200.times do |n|
  rand_id = rand(1..(100 + n))
  prompt = Prompt.find(rand_id)
  new_prompt = User.find(rand(1..75)).prompts.create(body: Faker::Hacker.say_something_smart, source_id: rand_id)
  prompt.responses << new_prompt
  prompt.save
end
