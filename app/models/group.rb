class Group < ApplicationRecord
    has_many :progressions
    has_many :discussions
    has_many :users
    has_many :events
    has_one_attached :picture
    enum gender: {male: 1, female: 2, both: 3}
end
