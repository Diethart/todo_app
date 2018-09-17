class ChecklistTemplatesController < ApplicationController
  before_action :find_checklist_template, only: %i[edit update show destroy]
  def index
    @checklist_templates = ChecklistTemplate.all
  end

  def new
    @checklist_template = ChecklistTemplate.new
  end

  def create
    checklist_template = ChecklistTemplate.new

    if checklist_template.save
      ChecklistTemplatesItem.bind_items(checklist_template_params[:items], checklist_template)
      flash[:success] = t('checklist_templates.success_create')
      redirect_to checklist_templates_path
    else
      flash[:danger] = t('checklist_templates.fail_create')
      redirect_to new_checklist_template_path
    end
  end

  def edit; end

  def update
    ids = @checklist_template.items.pluck(:id)
    params_ids = checklist_template_params[:items].reject(&:blank?).map(&:to_i)
    delete_ids = ids - params_ids
    create_ids = params_ids - ids


    delete_ids.each do |id|
      @checklist_template.checklist_templates_items.find_by(item_id: id).destroy
    end

    ChecklistTemplatesItem.bind_items(create_ids, @checklist_template)

    redirect_to checklist_template_path(@checklist_template.id)
  end

  def show; end

  def destroy
    @checklist_template.destroy

    flash[:success] = t('checklist_template.success_destroy')
    redirect_to checklist_templates_path
  end

  private

  def checklist_template_params
    params.require(:checklist_template).permit(items: [])
  end

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:id])
  end
end
