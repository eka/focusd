# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    context
    sequence :name do |n|
      "task-#{n}"
    end
    notes "this is a note for the task"
  end
end
