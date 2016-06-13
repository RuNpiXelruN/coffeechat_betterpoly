class Subject < ApplicationRecord
  belongs_to :subjectable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
end
