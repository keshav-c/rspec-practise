FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { "A sample project." }
    due_on { 1.week.from_now }
    # Either specify the user alias (owner) in it's factory or 
    # specify the factory in the explicit association below
    association :owner

    factory :project_due_yesterday do
      due_on { 1.day.ago }
    end

    factory :project_due_today do
      due_on { Date.current.in_time_zone }
    end

    factory :project_due_tomorrow do
      due_on { 1.day.from_now }
    end
  end
end
