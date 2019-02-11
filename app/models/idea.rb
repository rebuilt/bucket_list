class Idea < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 75 }

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :users

  paginates_per 9

  scope :most_recent, -> { order(updated_at: :desc).limit(3) }
  scope :title_contains, ->(term) { where('title LIKE ?', "%#{term}%") }
  scope :description_contains, ->(term) { where('description LIKE ?', "%#{term}%") }
  scope :search, ->(term) { title_contains(term).or(description_contains(term)) }
end
