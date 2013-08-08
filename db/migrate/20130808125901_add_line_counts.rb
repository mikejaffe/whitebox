class AddLineCounts < ActiveRecord::Migration
  def change
  	add_column :products, :line_count, :integer
  end
end
