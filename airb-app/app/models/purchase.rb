class Purchase < ActiveRecord::Base
  validates :customer_name, :product_name, :product_model, :price, :purchase_date, :maintnance_date, presence: true

  def self.search(query)
     where("customer_name || product_name || product_model || price || purchase_date || maintnance_date || id like ?", "%#{query}%")
   end

end
