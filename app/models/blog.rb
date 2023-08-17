class Blog < ApplicationRecord
    before_save :generate_slug
    before_destroy :delete_attached_image
    belongs_to :user, foreign_key: :user_id
    belongs_to :category, foreign_key: :category_id
    has_many :blogs_tags, dependent: :destroy
    has_many :tags, through: :blogs_tags
    has_one_attached :image
    accepts_nested_attributes_for :tags, allow_destroy: true
    validates :title, presence: true, uniqueness: true
    validates :slug, uniqueness: true, allow_blank: true
    validates :content, presence: true
    validates :category_id, presence: true
    validate :acceptable_image

    private

    def acceptable_image
        return unless image.attached?
      
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(image.content_type)
          errors.add(:image, "must be a JPEG or PNG")
        end
    end

    def delete_attached_image
      image.purge if image.attached?
    end
end
