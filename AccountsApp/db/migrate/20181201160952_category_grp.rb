class CategoryGrp < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories
    drop_table :category_grps
  end
end
