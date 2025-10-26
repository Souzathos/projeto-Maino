class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true

  validates :rating, presence: true, inclusion: { in: 1..5 }
end