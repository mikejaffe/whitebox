class AddCharCoounts < ActiveRecord::Migration
  def change
	add_column :products, :char_count, :integer
  end
end
