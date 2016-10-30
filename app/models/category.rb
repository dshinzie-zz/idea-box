class Category < ApplicationRecord
  validates :name, presence: true

  has_many :ideas, dependent: :destroy

  def self.sorted_categories
    order(created_at: :desc)
  end
end
