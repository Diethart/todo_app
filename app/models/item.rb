class Item < ApplicationRecord
  validates :task, presence: true
  validates_length_of :tasl, maximum: 100
end
