class User < ApplicationRecord
  has_many :posts ,dependent: :destroy
  has_one_attached :photo
  has_secure_password
  validates :email , presence: true, uniqueness:true
  has_many:comments, dependent: :destroy

  acts_as_voter
end
