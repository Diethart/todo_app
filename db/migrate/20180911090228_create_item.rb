class CreateItem < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :task, null: false, limit: 100

      t.timestamps
    end
  end
end
