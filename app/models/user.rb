class User < ApplicationRecord
  # Devise modules que você já tiver (não mexa neles)
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  has_many :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
end