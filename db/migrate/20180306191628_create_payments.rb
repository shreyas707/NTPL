class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.integer :sauda_id

      t.timestamps null: false
    end
  end
end
