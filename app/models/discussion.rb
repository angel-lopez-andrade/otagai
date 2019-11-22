class Discussion < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :posts
end
