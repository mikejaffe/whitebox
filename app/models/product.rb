class Product < ActiveRecord::Base
	validates_uniqueness_of :sku
	belongs_to :line_item
end
