class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subject
      t.text :review
      t.string :podcast_url
      t.timestamps
    end
  end
end
