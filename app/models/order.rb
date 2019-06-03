class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :order_items
  
  before_create :set_buyer

  def set_buyer
    self[:user_id] = user.id
  end
end
