require 'faker'

FactoryBot.define do
  factory :item_result do
    item
    checklist
    done false
  end
end
