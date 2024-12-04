FactoryBot.define do
  factory :user do
    username { "testuser" }
    email { "testuser@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end