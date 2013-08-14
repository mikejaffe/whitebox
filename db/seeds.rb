# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.find_or_create_by_sku({:sku => "tall-box", :name => "TALL BOX", :description => "300x250 pixels",:price => 75.00, :line_count => 3,:char_count => 45})
Product.find_or_create_by_sku({:sku => "flat-box", :name => "FLAT BOX", :description => "468x60 pixels",:price => 50.00, :line_count => 3,:char_count => 26})
