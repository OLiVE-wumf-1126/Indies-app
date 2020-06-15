class Followartist < ApplicationRecord
  belongs_to :listener
  belongs_to :artist


  validates :artist_id,:listener_id,          presence: true
end
