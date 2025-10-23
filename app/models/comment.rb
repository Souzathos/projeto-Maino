class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true

  # 🔹 validações
  validates :content, presence: true
  validates :name, presence: true, if: -> { user_id.nil? }

  # 🔹 ordena os comentários do mais recente pro mais antigo
  scope :newest, -> { order(created_at: :desc) }
end
