FactoryBot.define do
  factory :user do
    first_name { "Keshav" }
    last_name { "Chakravarthy" }
    sequence(:email) { |n| "tester#{n}@mail.com" }
    password { "password" }
  end
end
