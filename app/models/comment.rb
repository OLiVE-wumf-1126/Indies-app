class Comment < ApplicationRecord
  belongs_to :listener
  belongs_to :post

  validates :comment,          presence: true
  validates :post_id,:listener_id,          presence: true
end