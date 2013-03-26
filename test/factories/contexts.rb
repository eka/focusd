# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :context do
    user
    sequence :name do |n|
      "main-#{n}"
    end
  end
end
