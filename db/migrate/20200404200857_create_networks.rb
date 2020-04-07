class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :icon
      t.string :connector, :default => "db/seed"
      t.string :api_url, :default => "database"

      t.timestamps
    end

    add_index :networks, :name
  end
end
