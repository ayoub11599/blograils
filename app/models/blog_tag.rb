class BlogTag < ApplicationRecord
    self.table_name = "blogs_tags"
    belongs_to :blog
    belongs_to :tag
end