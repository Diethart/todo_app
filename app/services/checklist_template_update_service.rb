class ChecklistTemplateUpdateService
  class << self
    def update_checklist_template(checklist_template, params)
      ids = checklist_template.items.pluck(:id)
      params_ids = params[:items].reject(&:blank?).map(&:to_i)
      delete_ids = ids - params_ids
      create_ids = params_ids - ids

      delete_ids.each do |id|
        checklist_template.checklist_templates_items.find_by(item_id: id).destroy
      end

      checklist_template.items << Item.where(id: create_ids)
    end
  end
end
