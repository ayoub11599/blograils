class Image < ApplicationRecord
    belongs_to :blog, foreign_key: :blog_id
    validates :url, presence: true
end
