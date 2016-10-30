class Idea < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :category, optional: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def sorted_ideas
    order(created_at: :desc)
  end
end
