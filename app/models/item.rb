class Item < ApplicationRecord
  validates :task, presence: true
  validates_length_of :task, maximum: 100
end
