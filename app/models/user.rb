class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum gender: {male: 1, female: 2}
  belongs_to :group
  has_many :progressions
  has_many :discussions
  has_many :events
end
