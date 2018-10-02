class ChecklistTemplateUpdateService
  class << self
    def call(checklist_template, params)
      ids = checklist_template.items.pluck(:id)
      params_ids = params[:items].reject(&:blank?).map(&:to_i)
      delete_ids = ids - params_ids
      create_ids = params_ids - ids
      
      checklist_template.checklist_templates_items.where(id: delete_ids).destroy_all
      checklist_template.items << Item.where(id: create_ids)
    end
  end
end
