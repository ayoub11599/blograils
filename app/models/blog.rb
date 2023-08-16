class Blog < ApplicationRecord
    before_save :generate_slug
    belongs_to :user, foreign_key: :user_id
    belongs_to :category, foreign_key: :category_id
    #has_one_attached :image
    has_one :image, foreign_key: :blog_id, dependent: :destroy
    #accepts_nested_attributes_for :image
    validates :title, presence: true, uniqueness: true
    validates :slug, uniqueness: true, allow_blank: true
    validates :content, presence: true
    validates :category_id, presence: true
    #validate :image_format

    private

    def image_format
        return unless image.attached?

        unless image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG')
        end
    end
end
