# Class representing checklist elements
class Item < ApplicationRecord
  validates :task, presence: true, length: { maximum: 100 }
  has_many :checklist_templates_items
  has_many :checklist_templates, through: :checklist_templates_items
end
