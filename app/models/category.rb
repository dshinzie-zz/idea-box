class Category < ApplicationRecord
  validates :name, presence: true

  has_many :ideas, dependent: :destroy
end
