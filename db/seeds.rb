# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Event.create!(
  name: 'RubyConf 2023',
  description: 'The largest Ruby conference in the world.',
  banner_image: 'rubyconf.jpg',
  status: 'active',
  max_allocation: 100
)

Event.create!(
  name: 'Rails Workshop 2023',
  description: 'A hands-on workshop for learning Ruby on Rails.',
  banner_image: 'rails_workshop.jpg',
  status: 'inactive',
  max_allocation: 50
)