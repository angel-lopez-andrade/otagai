class Progression < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_one_attached :picture
end
