FactoryGirl.define do
  factory :user do
    email 'bob@bob.com'
    password 'secret123'
    password_confirmation 'secret123'

    trait :no_credits do 
      credits 0
    end

    trait :with_credits do
      credits 5
    end
  end
end