class RenameColumnToSucCtgId < ActiveRecord::Migration[5.2]
  def change
    rename_column :postdata, :category_id, :sub_category_id
  end
end
