FactoryBot.define do
  factory :note do
    # Explicit or implicit assocation can be used
    # (data retrieved from the corresponding factory)
    user
    project
    message { "A sample note." }
  end
end
