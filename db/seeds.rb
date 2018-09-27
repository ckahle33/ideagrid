# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do |i|
  user = User.new(email: "dev#{i}@ideagrid.org", password: 'password', password_confirmation: 'password', confirmed_at: Time.now)
  user.save
  Idea.find_or_create_by!(title: Faker::RickAndMorty.quote, description: Faker::Seinfeld.quote, user_id: user.id)
  Vote.create(user_id: user.id, idea_id: Idea.order("RANDOM()").first.id )
  Tag.create(name: Faker::Cannabis.strain)
  IdeaTag.create(tag_id: Tag.order("RANDOM()").first.id, idea_id: Idea.order("RANDOM()").first.id)
end
