class ChecklistTemplatesController < ApplicationController
  before_action :find_checklist_template, only: %i[edit update show destroy]
  decorates_assigned :checklist_template

  def index
    @checklist_templates = ChecklistTemplate.all
  end

  def new
    @checklist_template = ChecklistTemplate.new
  end

  def create
    checklist_template = ChecklistTemplate.new

    if checklist_template.save
      ChecklistTemplateHandlingService.call(checklist_template, checklist_template_params)

      flash[:success] = t('checklist_templates.success_create')
      redirect_to checklist_templates_path
    else
      flash[:danger] = t('checklist_templates.fail_create')
      redirect_to new_checklist_template_path
    end
  end

  def edit; end

  def update
    ChecklistTemplateHandlingService.call(@checklist_template, checklist_template_params)

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
