class Book < ApplicationRecord
  belongs_to :user
  has_many :introduces, dependent: :destroy
end
