FactoryBot.define do
  # The alias is needed for the project association to work
  factory :user, aliases: [:owner] do
    first_name { "Keshav" }
    last_name { "Chakravarthy" }
    sequence(:email) { |n| "tester#{n}@mail.com" }
    password { "password" }
  end
end
