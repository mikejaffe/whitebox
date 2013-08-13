class AddOrderSessionKey < ActiveRecord::Migration
  def change
	add_column :orders,:order_session_key, :string
  end
end
