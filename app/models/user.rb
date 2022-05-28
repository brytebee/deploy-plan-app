class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :transactions, foreign_key: 'author_id', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
end
