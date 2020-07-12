class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :availabilities
  has_many :user_types
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  after_create :create_user_type

  def create_user_type
    user_types.create(type_name: UserType::REGULAR)
  end

  def admin?
    user_types.pluck(:type_name).include?(UserType::ADMIN)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
