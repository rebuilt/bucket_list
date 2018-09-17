class Idea < ApplicationRecord
  validates :title, presence: true
  def self.search(search_term)
    where('title LIKE  ?', "%#{search_term}%")
  end

  def self.most_recent
    all.order(updated_at: :desc).limit(3)
  end
end
