class CreateChecklist < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.references :checklist_template, foreign_key: true

      t.timestamps
    end
  end
end
