class RenameCategoryConfig < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_configs, :categories 
  end
end
