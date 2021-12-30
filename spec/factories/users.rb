FactoryBot.define do
  # The alias is needed for the project association to work
  factory :user, aliases: [:owner] do
    first_name { "Keshav" }
    last_name { "Chakravarthy" }
    sequence(:email) { |n| "tester#{n}@mail.com" }
    password { "password" }

    trait :ram_user do
      first_name { "Ram" }
      last_name { "Chandra" }
      email { "r@c.c" }
      password { "password" }
    end

    trait :krishna_user do
      first_name { "Krishna" }
      last_name { "Vasudev" }
      email { "k@v.c" }
      password { "password" }
    end
  end
end
