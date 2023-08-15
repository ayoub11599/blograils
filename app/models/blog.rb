class Blog < ApplicationRecord
    before_save :generate_slug
    belongs_to :category, foreign_key: :category_id
    validates :title, presence: true, uniqueness: true
    validates :slug, uniqueness: true, allow_blank: true
    validates :content, presence: true
    validates :category_id, presence: true

    private

    def category_exists
        begin
            Category.find(self.category_id)
        rescue ActiveRecord::RecordNotFound
            errors.add(:category_id, "La catégorie n'existe pas.")
            false
        end
    end
end
