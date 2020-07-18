class Listener < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followartists, dependent: :destroy
  has_many :followartist_artists, through: :followartists, source: :artist
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

  before_save { self.email = email.downcase }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i.freeze
  validates :nickname, presence: true
  validates :password, :password_confirmation, allow_blank: true, format: { with: VALID_PASSWORD_REGEX }
end
