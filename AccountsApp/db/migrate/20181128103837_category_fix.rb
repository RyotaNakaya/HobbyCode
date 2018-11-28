class CategoryFix < ActiveRecord::Migration[5.2]
  def change
    drop_table :category1s
    drop_table :category2s
    drop_table :category_configs
    create_table :category_grps do |t|
      t.string :category_grp_name
      t.integer :disp_order
      t.integer :user_id

      t.timestamps
    end
    create_table :category_configs do |t|
      t.integer :category_no
      t.string :category_name
      t.integer :category_grp_id
      t.integer :disp_order
      t.integer :user_id

      t.timestamps
    end
  end
end
