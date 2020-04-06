class CreateSocialMediaAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_accounts do |t|
      t.integer :person_id
      t.string :network
      t.string :username
      t.string :profile_link

      t.timestamps
    end

    add_index :social_media_accounts, :person_id
    add_index :social_media_accounts, :network
    add_index :social_media_accounts, :username
  end
end
