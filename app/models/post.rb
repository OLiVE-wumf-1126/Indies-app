class Post < ApplicationRecord
  belongs_to :artist
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_taggable

  def favorited_by?(listener)
    favorites.where(listener_id: listener.id).exists?
  end

  validates :youtube_url, presence: true
  validates :text, :title, presence: true
end
