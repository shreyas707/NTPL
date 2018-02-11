class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :size
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
