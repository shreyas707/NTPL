class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.date :date
      t.float :total
      t.integer :sauda_id

      t.timestamps null: false
    end
  end
end
