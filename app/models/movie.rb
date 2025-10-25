class Movie < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_one_attached :poster  # ✅ Aqui adiciona o upload de imagem

  validates :title, :year, :duration, :director, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1887 }
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  scope :newest, -> { order(created_at: :desc) }

  attr_accessor :category_names

  def save_categories(names)
    return if names.blank?

    self.categories = names.split(",").map do |name|
      Category.find_or_create_by(name: name.strip.titleize)
    end
  end
end