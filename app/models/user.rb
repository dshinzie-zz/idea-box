class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password

  has_many :ideas, dependent: :destroy

  def sorted_ideas
    ideas.order(created_at: :desc)
  end

end
