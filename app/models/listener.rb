class Listener < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :listener
  has_many :followartists
  has_many :followartist_artists, through: :followartists, source: :artist
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments


  def follow(other_listener)
    unless self == other_listener
      self.relationships.find_or_create_by(follow_id: other_listener.id)
    end
  end

  def unfollow(other_listener)
    relationship = self.relationships.find_by(follow_id: other_listener.id)
    relationship.destroy if relationship
  end

  def following?(other_listener)
    self.followings.include?(other_listener)
  end
end
