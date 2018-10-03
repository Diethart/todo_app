class ChecklistTemplateDecorator < Draper::Decorator
  delegate_all

  def select2_items
    sorted_items + Item.all.where.not(id: items.pluck(:id))
  end
end
