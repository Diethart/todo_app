class ChecklistTemplateUpdateService
  class << self
    def position_items(checklist_template, params)
      items = prepare_params(params)

      items.each_with_index do |item, number|
        checklist_template.checklist_templates_items.find_by(item_id: item).update(position: number)
      end
    end

    def call(checklist_template, params)
      ids = checklist_template.items.pluck(:id)
      params_ids = prepare_params(params)
      delete_ids = ids - params_ids
      create_ids = params_ids - ids

      checklist_template.checklist_templates_items.where(item_id: delete_ids).destroy_all
      checklist_template.items << Item.where(id: create_ids)

      position_items(checklist_template, params)
    end

    private

    def prepare_params(params)
      params[:items].reject(&:blank?).map(&:to_i)
    end
  end
end
