class Tag < ApplicationRecord
    before_save :generate_slug
    has_many :blogs_tags
    has_many :blogs, through: :blogs_tags
    validates :name, presence: true, uniqueness: true
    validates :slug, uniqueness: true, allow_blank: true
end
