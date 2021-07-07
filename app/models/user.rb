class User < ActiveRecord::Base
  validates :first_name, presence: :true
  validates :email, presence: :true
  has_secure_password

  has_many :orders
  has_many :carts

  def self.customer
    where(role: "customer")
  end

  def self.clerk
    where(role: "clerk")
  end

  def self.owner
    where(role: "owner")
  end
end
