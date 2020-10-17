class Book < ApplicationRecord
  belongs_to       :user
  has_many         :introduces, dependent: :destroy
  has_one_attached :image
  has_many         :acts, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # validates
  title_length = { maximum: 40, message: 'は40文字以内で記入してください' }
  writer_length = { maximum: 100, message: 'は100文字以内で記入してください' }
  with_options presence: true do
    validates :category_id
    validates :title,  length: title_length
    validates :writer, length: writer_length
    validates :publish
    validates :company, length: title_length
  end
end
