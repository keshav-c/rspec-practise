FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { "A sample project." }
    due_on { 1.week.from_now }
    # Either specify the user alias (owner) in it's factory or 
    # specify the factory in the explicit association below
    association :owner

    trait :due_yesterday do
      due_on { 1.day.ago }
    end

    trait :due_today do
      due_on { Date.current.in_time_zone }
    end

    trait :due_tomorrow do
      due_on { 1.day.from_now }
    end

    # The with_notes trait will add 5 new notes to newly created project.
    # create callback is called only for project factoryobject created with the
    # with_notes trait. This way test execution is not slowed down.
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end
  end
end
