class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :member
  validates :content, presence: true, length: {maximum: Settings.Comment.content}

  scope :order_by, ->(direction){order created_at: direction}
  delegate :name, to: :member, prefix: true
end
