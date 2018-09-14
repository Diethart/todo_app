require 'faker'

FactoryBot.define do
  factory :item do
    task Faker::Lorem.sentence
  end
end
