class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :followartists

  mount_uploader :artistimage, ImageUploader

  def followartist_by?(listener)
    followartists.where(listener_id: listener.id).exists?
  end
end
