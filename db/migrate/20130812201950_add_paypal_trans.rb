class AddPaypalTrans < ActiveRecord::Migration
  def change
	add_column :orders, :paypal_result, :string
  end
end
