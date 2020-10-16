class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,       dependent: :destroy
  has_many :introduces,  dependent: :destroy
  has_many :acts,        dependent: :destroy

  with_options presence: true do
    validates :name
    validates :email
    validates :password
  end
end
