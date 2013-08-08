class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	has_many :medias

	accepts_nested_attributes_for :medias 
end
