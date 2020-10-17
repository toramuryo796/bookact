class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,       dependent: :destroy
  has_many :introduces,  dependent: :destroy
  has_many :acts,        dependent: :destroy

  # validate
  name_length = { maximum: 40 , message: "は40字以内で入れてください"}
  name = { with: /\A[a-zA-Z0-9]+\Z/, message: "は全角・スペース・記号を入れないでください" }
  email = { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "には'@'をつけてください" } 
  pass = { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)+/, message: 'は半角英数字を混合させて入力してください' }
  with_options presence: true do
    validates :name,  length: name_length, format: name
    validates :email, uniqueness: true, format: email
    validates :password, format: pass
  end
end
