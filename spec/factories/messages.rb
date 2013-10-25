# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    phone "MyString"
    body "MyText"
  end
end
