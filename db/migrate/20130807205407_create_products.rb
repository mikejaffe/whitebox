class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :sku
    	t.string :name
    	t.string :description
    	t.decimal :price , :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
