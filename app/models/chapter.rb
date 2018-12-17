class Chapter < ApplicationRecord
  belongs_to :story
  belongs_to :member
  scope :order_by, ->(direction){order created_at: direction}

  validates :content, presence: true
  validates :name, presence: true
end
