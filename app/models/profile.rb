class Profile < ApplicationRecord
  belongs_to :user
  has_many :locations, as: :locationable
  has_many :subjects, as: :subjectable
  has_many :comments, as: :commentable
end
