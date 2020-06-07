class Post < ApplicationRecord
  belongs_to :artist
  has_many :favorites


  def favorited_by?(listener)
    favorites.where(listener_id: listener.id).exists?
end
end
