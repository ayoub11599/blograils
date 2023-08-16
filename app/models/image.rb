class Image < ApplicationRecord
    belongs_to :blog, foreign_key: :blog_id
end
