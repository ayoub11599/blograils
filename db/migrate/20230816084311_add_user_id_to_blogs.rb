class AddUserIdToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :user, foreign_key: true, after: :category_id, null: true
    add_foreign_key :blogs, :users
  end
end
