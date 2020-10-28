# FactoryGirl.define do
#   factory :user do
#     username { FFaker::Name.first_name }
#     email { FFaker::Internet.email }
#     password { Devise.friendly_token.first(8)}
#   end
# end

FactoryGirl.define do
  factory :user do
    username "thabani"
    email "drthabani@hotmail.com"
    password "password"
  end
end
