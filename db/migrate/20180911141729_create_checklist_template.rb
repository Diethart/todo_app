class CreateChecklistTemplate < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_templates do |t|
      t.timestamps
    end
  end
end
