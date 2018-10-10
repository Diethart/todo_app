class AddTitleToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :title, :string
  end
end
