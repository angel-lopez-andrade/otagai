class Group < ApplicationRecord
    has_many :progressions
    has_many :discussions
    has_many :events
    has_one_attached :picture
end
