class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :social_media_account_id
      t.datetime :post_date
      t.string :link
      t.text :content

      t.timestamps
    end

    add_index :posts, :social_media_account_id
    add_index :posts, :post_date
  end
end
