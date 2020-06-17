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

  before_save { self.email = email.downcase }
  VALID_PASSWORD_REGEX =       /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i
  validates :artistname,          presence: true 
  validates :password, :password_confirmation,          allow_blank: true, format: { with: VALID_PASSWORD_REGEX }
end
