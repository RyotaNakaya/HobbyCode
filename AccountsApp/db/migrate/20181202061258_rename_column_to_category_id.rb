class RenameColumnToCategoryId < ActiveRecord::Migration[5.2]
  def change
    rename_column :postdata, :sub_category_id, :category_id
  end
end
