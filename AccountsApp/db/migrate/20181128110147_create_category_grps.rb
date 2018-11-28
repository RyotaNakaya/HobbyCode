class CreateCategoryGrps < ActiveRecord::Migration[5.2]
  def change
    drop_table :category_grps
    create_table :category_grps do |t|
      t.string :category_grp_name
      t.integer :disp_order
      t.integer :user_id

      t.timestamps
    end
  end
end
