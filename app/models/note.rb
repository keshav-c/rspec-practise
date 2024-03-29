class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # create a user_name method to get owner's full name
  delegate :name, to: :user, prefix: true

  validates :message, presence: true

  scope :search, ->(term) {
    where("LOWER(message) LIKE ?", "%#{term.downcase}%")
  }
end
