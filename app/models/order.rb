class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items


  def compute_total(order)
  total = 0
  order.items.each do |i|
      total += i.price
    end
  return total
  end 


end
