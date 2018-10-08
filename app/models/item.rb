# Class representing checklist elements
class Item < ApplicationRecord
  validates :task, presence: true, length: { maximum: 100 }
  acts_as_taggable

  has_many :checklist_templates_items, dependent: :destroy
  has_many :checklist_templates, through: :checklist_templates_items
end
