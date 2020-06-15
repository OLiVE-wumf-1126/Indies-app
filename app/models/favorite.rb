class Favorite < ApplicationRecord
  belongs_to :listener
  belongs_to :post

  validates :listener_id,:post_id,          presence: true
end
