class CreateSaudas < ActiveRecord::Migration
  def change
    create_table :saudas do |t|
      t.string :number
      t.date :date
      t.integer :customer_id
      t.boolean :is_order_taken
      t.boolean :is_delivered

      t.timestamps null: false
    end
  end
end
