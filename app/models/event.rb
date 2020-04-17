class Event < ApplicationRecord
  validates :group_id, :user_id, :date, :description, :name, presence: :true
  belongs_to :group
  belongs_to :user
  has_one_attached :picture
end
