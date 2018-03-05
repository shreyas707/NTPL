class ChangeInSaudaTable < ActiveRecord::Migration
  def change
  	remove_column :saudas, :is_order_taken
  	remove_column :saudas, :is_delivered

  	add_column :saudas, :is_order_taken, :boolean, default: false
  	add_column :saudas, :is_delivered, :boolean, default: false
  end
end
