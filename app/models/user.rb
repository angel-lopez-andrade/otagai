class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :encrypted_password, :description, :gender, :age, :username, presence: :true
  enum gender: {male: 1, female: 2}
  belongs_to :group, optional: true
  has_many :progressions
  has_many :discussions
  has_many :events
  has_one_attached :picture
end
