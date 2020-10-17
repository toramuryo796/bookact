class Introduce < ApplicationRecord
  belongs_to :user
  belongs_to :book

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :star

  # validates
  title_length = { maximum: 40, message: 'は40文字以内で記入してください' }
  content_length = { maximum: 1000, message: 'は1000文字以内で記入してください' }
  with_options presence: true do
    validates :title, length: title_length 
    validates :content, length: content_length
    validates :star_id
  end
end
