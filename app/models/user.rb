class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :stories
  has_many :favourites
  has_many :photos
  has_many :spots, through: :favourites
  has_many :follows

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9\.\-\_]{3,24}\z/, message: "Username must be between 3 and 24 letters long and can contain the letters A-Z, 0-9 , or the characters '.' , '/' and '_' . " }
  validates :bio, presence: true, length: { maximum: 500 }

  def followers
    follows.where("leader_id = #{id}").map { |f| f.follower }
  end

  def following
    follows.where("follower_id = #{id}").map { |f| f.follower }
  end
end
