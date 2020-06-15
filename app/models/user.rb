class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
end
