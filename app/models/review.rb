class Review < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :comment, length: { minimum: 20 }
  validates :comment, presence: true
end
