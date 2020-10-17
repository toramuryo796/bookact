class Act < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # validation
  length =  { maximum: 200, message: 'は200文字以内で記入してください' }
  with_options presence:true do
    validates :page, format: {with: /\A[0-9]+\Z/, message: 'は半角数字を入力してください'}
    validates :content, length: length
    validates :point, length: length
    validates :act, length: length
  end
end
