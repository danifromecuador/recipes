FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    name { "User Name" }
    password { "User Password" }
  end
end