class Followartist < ApplicationRecord
  belongs_to :listener
  belongs_to :artist
end
