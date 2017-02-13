class User < ApplicationRecord
  has_secure_password
  has_many :secrets
  # has_many :secrets, through: :likes
  has_many :secrets_liked, through: :likes, source: :secret
  has_many :likes, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
end