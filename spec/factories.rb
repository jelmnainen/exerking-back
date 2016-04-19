FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'

    factory :student do
      teacher false
    end

    factory :teacher do
      teacher true
    end
  end

  factory :category do
    title 'Category'
  end

  factory :exercise do
    batch
    title 'Exercise 1'
    text 'Description'
  end

  factory :batch do
    title 'Week 1'
    deadline { 2.days.from_now }

    trait :expired do
      deadline { 2.days.ago }
    end

    factory :batch_with_exercises do
      transient do
        exercises_count 5
      end

      after(:create) do |batch, evaluator|
        create_list(:exercise, evaluator.exercises_count, batch: batch)
      end
    end
  end
end
