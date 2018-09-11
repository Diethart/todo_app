# Class representing checklist elements
class Item < ApplicationRecord
  validates :task, presence: true, length: { maximum: 100 }
  belongs_to :checklist_template
end
