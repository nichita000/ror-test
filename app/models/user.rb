class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :customer, :dependent => :destroy

  def user_id
  	id or where(email: email).id
  end
end
