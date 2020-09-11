class Post < ApplicationRecord
	validates :images, presence: true
	validates :caption, presence: true
	has_many_attached :images
end
