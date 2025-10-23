  class Movie < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, :year, :duration, :director, presence: true
    validates :year, numericality: { only_integer: true, greater_than: 1887 } # primeiro filme ~1890
    validates :duration,  numericality: { only_integer: true, greater_than: 0 }

    scope :newest, -> { order(created_at: :desc) }
  end