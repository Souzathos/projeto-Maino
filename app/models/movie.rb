class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :reviews, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_one_attached :poster

  validates :title, :year, :duration, :director, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1887 }
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  attr_accessor :category_names, :tag_names
  attr_accessor :category_names, :tag_names, :remove_poster
  
  before_save :save_categories
  before_save :save_tags

  scope :newest, -> { order(created_at: :desc) }

  def save_categories(_arg = nil)
    return if category_names.blank?

    self.categories = category_names.split(",").map do |name|
      Category.find_or_create_by(name: name.strip.titleize)
    end
  end

  def save_tags(_arg = nil)
    return if tag_names.blank?

    self.tags = tag_names.split(",").map do |tag|
      Tag.find_or_create_by(name: tag.strip.downcase)
    end
  end

  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end
