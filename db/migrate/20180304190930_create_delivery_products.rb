class CreateDeliveryProducts < ActiveRecord::Migration
  def change
    create_table :delivery_products do |t|
      t.integer :delivery_id
      t.integer :product_id
      t.integer :delivery_quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
