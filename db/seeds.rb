# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
#
# # Create dummy users / clients
#
# 5.times do
#     user = User.create(
#         full_name: Faker::Name.name,
#         email: Faker::Internet.free_email,
#         about: Faker::Quote.matz,
#         password: 'password',
#         from: Faker::Address.country,
#         language: Faker::Nation.language,
#         created_at: Date.today,
#         username: Faker::Name.first_name.downcase
#     )
#
#     user.avatar.attach(
#         io: image = open("https://i.pravatar.cc/300"),
#         filename: "avatar#{user.id}.jpg",
#         content_type: 'image/jpg'
#     )
# end
#
# # Create dummy trades / suppliers
#
# 5.times do
#     trade = Trade.create(
#         full_name: Faker::Name.name,
#         email: Faker::Internet.free_email,
#         about: Faker::Quote.matz,
#         password: 'password',
#         from: Faker::Address.country,
#         language: Faker::Nation.language,
#         created_at: Date.today,
#         username: Faker::Name.first_name.downcase
#     )
#
#     trade.avatar.attach(
#         io: image = open("https://i.pravatar.cc/300"),
#         filename: "avatar#{trade.id}.jpg",
#         content_type: 'image/jpg'
#     )
# end
#
# # Create dummy Category Levels
#
# Category.create(name: 'Home Cleaning')
# Category.create(name: 'Painting & Decorating')
# Category.create(name: 'Plumbing')
# Category.create(name: 'Gardening')
#
# # Create dummy catetories
# # 10.times do
# #     Category.create(
# #         name: Faker::Job.unique.field
# #     )
# # end
#
# # Create dummy Urgency levels
#
# Urgency.create(name: 'Today')
# Urgency.create(name: 'Within 24 Hours')
# Urgency.create(name: 'Within 48 Hours')
# Urgency.create(name: 'Within 3 Days')
# Urgency.create(name: 'Within 7 Days')
# Urgency.create(name: 'Within A Fortnight')
# Urgency.create(name: 'Within A Month')
# Urgency.create(name: 'Other')
#
# # Create dummy Offers
#
# 10.times do
#   random_trade = Trade.all.sample(1)[0]
#   category = Category.all.sample(1)[0]
#   offer = Offer.create(
#     title: Faker::Job.title,
#     description: Faker::Quote.matz,
#     price: Faker::Number.between(from:1, to:50),
#     discount_offer: Faker::Number.between(from:1,to:10),
#     delivery: Faker::Number.between(from:1, to:10),
#     supplier_id: random_trade.id,
#     category_id: category.id,
#     valid_from: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#     valid_to: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
#   )
# end
