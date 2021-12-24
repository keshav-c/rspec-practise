class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # create a user_name method to get owner's full name
  delegate :name, to: :user, prefix: true
end
