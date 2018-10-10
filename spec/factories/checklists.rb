require 'faker'

FactoryBot.define do
  factory :checklist do
    checklist_template
    title Faker::Book.title
  end
end
