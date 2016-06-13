class Profile < ApplicationRecord
  belongs_to :user
  has_many :locations, as: :locationable
  has_many :subjects, as: :subjectable
end
