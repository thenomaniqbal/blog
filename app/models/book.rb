class Book < ApplicationRecord
	has_and_belongs_to_many :articles
	validates :title, presence: true, length: { minimum: 5 }
end
