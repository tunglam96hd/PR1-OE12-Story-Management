class Member < ApplicationRecord
  has_many :follows
  has_many :stories, through: :follows

  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.Member.name.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.Member.email.maximum},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.Member.password.minimum}
  has_secure_password
end
