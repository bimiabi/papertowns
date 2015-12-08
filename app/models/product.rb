class Product < ActiveRecord::Base
  dragonfly_accessor :asset
  validates :product_name, :description, :product_model, :serial_number, :price, :stock, :asset, presence: true

  def self.search(query)
     where("product_name || description || product_model || serial_number || price || stock || id like  ?", "%#{query}%")
   end
end
