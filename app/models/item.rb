# Class representing checklist elements
class Item < ApplicationRecord
  validates :task, presence: true, length: { maximum: 100 }
end
