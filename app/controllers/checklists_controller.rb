class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show edit update destroy]

  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def create
    checklist = Checklist.new(checklist_params)

    if checklist.save
      checklist.items << checklist.checklist_template.items
  
      flash[:success] = t('checklists.success_create')
      redirect_to checklists_path
    else
      flash[:danger] = t('checklists.fail_create')
      redirect_to new_checklist_path
    end
  end

  def show; end

  def edit; end

  def update
    if @checklist.update(checklist_params)
      flash[:success] = t('checklists.success_update')
      redirect_to checklist_path(@checklist.id)
    else
      flash[:danger] = t('checklists.fail_update')
      redirect_to edit_checklist_path(@checklist.id)
    end
  end

  def destroy
    @checklist.destroy

    flash[:success] = t('checklists.success_destroy')
    redirect_to checklists_path
  end

  private

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:checklist_template_id, :title)
  end
end
