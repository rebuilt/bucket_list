class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  
  validates :user, presence: true
end
