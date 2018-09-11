class AddChecklistTemplateToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :checklist_template, foreign_key: true
  end
end
