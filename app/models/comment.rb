class Comment < ApplicationRecord
  belongs_to :listener
  belongs_to :post

  validates :comment,          presence: true
end
