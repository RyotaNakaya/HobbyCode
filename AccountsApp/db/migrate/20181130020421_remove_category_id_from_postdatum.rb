class RemoveCategoryIdFromPostdatum < ActiveRecord::Migration[5.2]
  def change
    remove_column :postdata, :categroy_id, :integer
    add_column :postdata, :category_id, :integer
  end
end
