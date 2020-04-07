class CreateSocialMediaAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_accounts do |t|
      t.integer :person_id
      t.integer :network_id
      t.string :username
      t.string :profile_link

      t.timestamps
    end

    add_index :social_media_accounts, :person_id
    add_index :social_media_accounts, :network_id
    add_index :social_media_accounts, :username
  end
end
