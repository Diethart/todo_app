# Realization of checklist templates
class ChecklistTemplate < ApplicationRecord
  has_many :checklist_templates_items, dependent: :destroy
  has_many :items, through: :checklist_templates_items

  def sorted_items
    items.includes(:checklist_templates_items).order('checklist_templates_items.position')
  end

  def select2_items
    sorted_items + Item.all.where.not(id: items.pluck(:id))
  end
end
