class Import < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  enum status: { queued: 0, processing: 1, completed: 2, failed: 3 }

  validates :file, presence: true
end