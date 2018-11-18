class Member < ApplicationRecord
  has_many :follows
  has_many :stories, through: :follows
end
