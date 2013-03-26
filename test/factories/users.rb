# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "pepe#{n}@galleta.com" }
    password "password"
  end
end
