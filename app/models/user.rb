class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def manager?
    type == 'User::Manager'
  end

  def coordinator?
    type == 'User::Coordinator'
  end
end
