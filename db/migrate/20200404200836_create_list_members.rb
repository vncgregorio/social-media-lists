class CreateListMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :list_members do |t|
      t.integer :person_id
      t.integer :list_id

      t.timestamps
    end

    add_index :list_members, :person_id
    add_index :list_members, :list_id
  end
end
