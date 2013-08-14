require 'csv'
class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	accepts_nested_attributes_for :line_items

	validates_uniqueness_of :paypal_result, :allow_nil => true

	before_create :generate_order_number

    def generate_order_number
      self.order_number = "R#{Time.now.year}#{Time.now.month}#{Time.now.day}#{Array.new(4){rand(9)}.join}" if self.order_number.blank?
      self.order_number
    end 

      def self.as_csv
        CSV.generate do |csv|
          csv << column_names
          all.each do |item|
            csv << item.attributes.values_at(*column_names)
          end
        end
      end
end
