class Product < ActiveRecord::Base
  dragonfly_accessor :asset
  validates :product_name, :description, :product_model, :serial_number, :price, :stock, presence: true
end
