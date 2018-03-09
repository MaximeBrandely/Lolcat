class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :items, through: :cart
  has_many :orders

  after_create :create_cart


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def create_cart
    Cart.create(user_id: self.id)
  end

end
