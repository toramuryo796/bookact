class Introduce < ApplicationRecord
  belongs_to :user
  belongs_to :book

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :star

  with_options presence: true do
    validates :title
    validates :content
    validates :star_id
  end
end
