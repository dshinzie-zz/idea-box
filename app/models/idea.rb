class Idea < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :category, optional: true

  has_many :idea_images
  has_many :images, through: :idea_images

  def sorted_ideas
    order(created_at: :desc)
  end
end
