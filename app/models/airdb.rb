class Airdb < ActiveRecord::Base

  def self.search(query)
     where("product_name || description || product_model || serial_number || price || stock || id like ?", "%#{query}%")
   end

end
