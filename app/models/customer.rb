class Customer < ActiveRecord::Base
  #When we install deivise for the cusomters we haveto delete the password field
  validates :customer_name, :username, :password, :registration_date, :email, :phone_number, :address, :gender, presence: true

  def self.search(query)
     where("customer_name || username || password || registration_date || email || phone_number || address || gender || id like ?", "%#{query}%")
   end
end
