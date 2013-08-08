class Order < ActiveRecord::Base
	has_many :line_items
	accepts_nested_attributes_for :line_items

	before_create :generate_order_number

    def generate_order_number
      self.order_number = "R#{Time.now.year}#{Time.now.month}#{Time.now.day}#{Array.new(4){rand(9)}.join}" if self.order_number.blank?
      self.order_number
    end 
end
