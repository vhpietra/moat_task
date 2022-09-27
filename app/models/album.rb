class Album < ApplicationRecord
    validates :album_name, presence: true
    validates :year, presence: true, length: {minimum:4, maximum:4}
    validates :artist, presence: true
end
