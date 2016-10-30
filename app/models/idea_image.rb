class IdeaImage < ApplicationRecord
  belongs_to :idea, optional: true
  belongs_to :image, optional: true
end
