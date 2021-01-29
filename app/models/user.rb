class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  AGE_RANGE = %w( 18-29 30-39 40-49 50-59 60-69 70+ ).freeze

  has_many :listings, dependent: :destroy
  has_many :bookings

  validates :first_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :password, presence: true, confirmation: true
  validates :age_range, presence: true, inclusion: { in: AGE_RANGE, message: "%{value} is not a valid age range" } 
end
