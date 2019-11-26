class Event < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :picture
end
