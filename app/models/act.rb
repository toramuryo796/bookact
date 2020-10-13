class Act < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence:true do
    validates :page
    validates :content
    validates :point
    validates :act
  end
end
