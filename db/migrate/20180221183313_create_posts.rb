class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :subject
      t.text :review
      t.string :podcast_url
    end
  end
end
