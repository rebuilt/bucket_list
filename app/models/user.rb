class User < ApplicationRecord
  has_many :comments
  has_many :ideas
  before_validation :downcase_email
  validates :email, uniqueness: true
  validates :email, :password, presence: true
  validates :role, inclusion: { in: %w[registered admin] }
  # attribute :role, :string, default: 'registered'

  after_initialize :default_role!
  has_secure_password

  has_and_belongs_to_many :goals, class_name: 'Idea'

  mount_uploader :avatar, AvatarUploader

  private

  def downcase_email
    self.email = email.downcase
  end

  def default_role!
    self.role ||= 'registered'
  end
end
