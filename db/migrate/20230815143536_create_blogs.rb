class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.references :category, foreign_key: true, null: true
      t.string :title
      t.string :slug
      t.text :content
      t.timestamps
    end
    add_foreign_key :blogs, :categories
  end
end
