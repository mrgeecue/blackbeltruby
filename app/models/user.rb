class User < ActiveRecord::Base
  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :idea, dependent: :destroy

  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, on: :create
end
