class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :blog, foreign_key: true, null: true
      t.string :url
      t.timestamps
    end
    add_foreign_key :images, :blogs
  end
end
