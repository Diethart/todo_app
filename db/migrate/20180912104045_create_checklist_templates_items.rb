class CreateChecklistTemplatesItems < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_templates_items do |t|
      t.references :checklist_template, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
