# Connecting class between ChecklistTemplate and Item
class ChecklistTemplatesItem < ApplicationRecord
  belongs_to :checklist_template
  belongs_to :item
end
