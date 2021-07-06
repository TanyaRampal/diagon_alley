class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.pending
    where(delivered_on: nil)
  end

  def self.delivered
    where.not(delivered_on: nil).order("delivered_on DESC")
  end

  def self.online
    where(walk_in_customer: nil).order("delivered_on DESC")
  end

  def self.walk_in
    where.not(walk_in_customer: nil).order("delivered_on DESC")
  end

  def self.has_delivered(delivered_by)
    where(delivered_by: delivered_by).order("delivered_on DESC")
  end
end
