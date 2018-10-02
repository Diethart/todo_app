class AddPositionNumberToChecklistTemplatesItems < ActiveRecord::Migration[5.1]
  def change
    add_column :checklist_templates_items, :position, :int, default: 0
  end
end
