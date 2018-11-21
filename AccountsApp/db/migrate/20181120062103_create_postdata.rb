class CreatePostdata < ActiveRecord::Migration[5.2]
  def change
    create_table :postdata do |t|
      t.string :category
      t.integer :amount
      t.date :date
      t.integer :unit
      t.text :remark
      t.text :store
      t.integer :yobi1
      t.integer :yobi2
      t.integer :yobi3

      t.timestamps
    end
  end
end
