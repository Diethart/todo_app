# Connecting class between ChecklistTemplate and Item
class ChecklistTemplatesItem < ApplicationRecord
  belongs_to :checklist_template
  belongs_to :item

  class << self
    def bind_items(items_ids, checklist_template)
      items_ids.each do |id|
        create(checklist_template: checklist_template, item_id: id)
      end
    end
  end
end
