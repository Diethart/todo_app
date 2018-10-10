require 'faker'

FactoryBot.define do
  factory :checklist_template do
    title Faker::Book.title
  end
end
