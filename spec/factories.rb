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
end
