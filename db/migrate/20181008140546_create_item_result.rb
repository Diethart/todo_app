class CreateItemResult < ActiveRecord::Migration[5.1]
  def change
    create_table :item_results do |t|
      t.references :checklist, foreign_key: true
      t.references :item, foreign_key: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
