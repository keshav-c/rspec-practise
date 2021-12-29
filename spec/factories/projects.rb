FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { "A sample project." }
    due_on { 1.week.from_now }
    # Either specify the user alias (owner) in it's factory or 
    # specify the factory in the explicit association below
    association :owner
  end
end
