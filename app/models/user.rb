class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :stories, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_one :photo, as: :photoable
  has_many :spots, through: :favourites
  has_many :follows

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9\.\-\_]{3,24}\z/, message: "Username must be between 3 and 24 letters long and can contain the letters A-Z, 0-9 , or the characters '.' , '/' and '_' . " }
  validates :bio, length: { maximum: 500 }

  def followers
    Follow.where("leader_id = #{id}").map { |f| f.follower }
  end

  def leaders
    Follow.where("follower_id = #{id}").map { |f| f.leader }
  end

  def leaders_ids
    Follow.where("follower_id = #{id}").map { |f| f.leader.id }
  end

  def following_current?
    Follow.exists?("leader_id = #{current_user.id} and follower_id = #{id}")
  end

  def followed_by_current?
    Follow.exists?("leader_id = #{id} and follower_id = #{current_user.id}")
  end

  def following(leader)
    Follow.where("leader_id = #{leader.id} and follower_id = #{id}")
  end

  include PgSearch::Model
  pg_search_scope :user_search,
    against: [[:username, 'A'], [:first_name, 'B'], [:last_name, 'C']],
    using: {
      tsearch: { prefix: true }
    }
end
