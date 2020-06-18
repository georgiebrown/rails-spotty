class Story < ApplicationRecord
  include Comparable
  # Associations
  belongs_to :user
  belongs_to :spot
  belongs_to :question
  has_many :photos, as: :photoable
  # accepts_nested_attributes_for :photos

  # Validations
  validates :user, presence: true
  validates :spot, presence: true
  validates :content, presence: true

  # Will sort active record relation of stories with stories from users
  # the current user is following sorted to the beginning
  # def self.sort_by_following(stories, user)
  #   sorted = stories.sort
  #   return sorted
  # end

  def <=>(other)
    current_user.following(user).size <=> current_user.following(other.user).size
    # user.id <=> other.user.id
  end
end
