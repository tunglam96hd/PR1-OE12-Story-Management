class Member < ApplicationRecord
  attr_accessor :remember_token
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

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
    
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = Member.new_token
    update remember_digest: Member.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update remember_digest: nil
  end
end
