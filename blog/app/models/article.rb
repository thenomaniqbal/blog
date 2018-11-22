class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :books
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, :default_url =>"missing.png", :path => "app/assets/images/:class/:attachment/:id/:basename_:style.:extension", :url => ":class/:attachment/:id/:basename_:style.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
