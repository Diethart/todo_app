# Realization of checklist templates
class ChecklistTemplate < ApplicationRecord
  has_many :checklist_templates_items, dependent: :destroy
  has_many :items, through: :checklist_templates_items
end
