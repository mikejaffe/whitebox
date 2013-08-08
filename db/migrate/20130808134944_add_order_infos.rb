class AddOrderInfos < ActiveRecord::Migration
  def change
  	add_column :orders, :user_id, :integer
  	add_column :orders, :status, :string, :default => "cart"
  	add_column :orders, :ad_url, :string
  	add_column :orders, :ad_mailto, :string
  	add_column :orders, :ad_start_date, :date
  	add_column :orders, :ad_run_days, :integer
  	add_column :orders, :ad_end_date, :date

  	add_column :orders, :total_cost, :decimal, :precision => 12, :scale => 2

  	add_column :orders, :email, :string
  	add_column :orders, :company_name, :string
  	add_column :orders, :website, :string
  	add_column :orders, :bill_first_name, :string
  	add_column :orders, :bill_last_name, :string
   	add_column :orders, :bill_address1, :string
  	add_column :orders, :bill_address2, :string
  	add_column :orders, :bill_city, :string
  	add_column :orders, :bill_state, :string
  	add_column :orders, :bill_zip, :string
  	add_column :orders, :bill_phone, :string

  	add_column :orders, :ship_first_name, :string
  	add_column :orders, :ship_last_name, :string
   	add_column :orders, :ship_address1, :string
  	add_column :orders, :ship_address2, :string
  	add_column :orders, :ship_city, :string
  	add_column :orders, :ship_state, :string
  	add_column :orders, :ship_zip, :string
  	add_column :orders, :ship_phone, :string

  end
end
