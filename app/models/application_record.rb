class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def formatted_created_at
    created_at.strftime('%d-%m-%Y %H:%M')
  end

  private

  def generate_slug
    self.slug = defined?(name) ?  name.parameterize : title.parameterize
  end
end
