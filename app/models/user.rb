class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :availabilities, dependent: :destroy
  has_many :user_types, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :work_events, through: :user_events
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :phone, presence: true
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

  def self.fetch_and_order_users_by_user_events
    self.left_joins(:user_events).group(:id).order('COUNT(user_events.id) DESC')
  end
end
