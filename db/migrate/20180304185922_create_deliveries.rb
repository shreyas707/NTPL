class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :number
      t.date :date
      t.float :total
      t.integer :sauda_id

      t.timestamps null: false
    end
  end
end
