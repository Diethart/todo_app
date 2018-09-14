class CreateChecklistTemplate < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_templates, &:timestamps
  end
end
