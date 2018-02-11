class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :number
      t.date :delivery_date
      t.float :deliverytotal
      t.integer :sauda_id

      t.timestamps null: false
    end
  end
end
