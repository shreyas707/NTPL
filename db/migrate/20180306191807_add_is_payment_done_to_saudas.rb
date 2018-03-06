class AddIsPaymentDoneToSaudas < ActiveRecord::Migration
  def change
  	add_column :saudas, :is_payment_done, :boolean, default: false
  end
end
