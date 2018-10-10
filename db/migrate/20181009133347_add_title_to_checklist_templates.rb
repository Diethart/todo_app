class AddTitleToChecklistTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :checklist_templates, :title, :string
  end
end
