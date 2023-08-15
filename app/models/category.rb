class Category < ApplicationRecord
    before_save :generate_slug
    has_many :blogs, foreign_key: :category_id
    validates :name, presence: true, uniqueness: true
    validates :slug, uniqueness: true, allow_blank: true
end
