class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
    	t.integer :line_item_id
    	t.text :media_text

      t.timestamps
    end
  end
end
