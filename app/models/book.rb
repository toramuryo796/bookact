class Book < ApplicationRecord
  belongs_to       :user
  has_many         :introduces, dependent: :destroy
  has_one_attached :image
  has_many         :acts, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :category_id
  end
end
