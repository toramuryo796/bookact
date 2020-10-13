class Introduce < ApplicationRecord
  belongs_to :user
  belongs_to :book

  with_options presence: true do
    validates :title
    validates :content
  end
end
