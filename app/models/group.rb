class Group < ApplicationRecord
    has_many :progressions
    has_many :discussions
    has_many :events
end
