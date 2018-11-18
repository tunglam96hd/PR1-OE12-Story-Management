class Story < ApplicationRecord
  belongs_to :author
  belongs_to :member
  has_many :category_stories
  has_many :categories, through: :category_stories
  has_many :follows
  has_many :members, through: :follows
end
