class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def manager?
    role == 'User::Manager'
  end

  def coordinator?
    role == 'User::Coordinator'
  end
end