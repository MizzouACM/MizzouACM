class CreateHacksUsersTable < ActiveRecord::Migration
  def up
    create_table :hacks_users, :id => false do |t|
        t.references :hack
        t.references :user
    end
    add_index :hacks_users, [:hack_id, :user_id]
    add_index :hacks_users, [:user_id, :hack_id]
  end

  def down
    drop_table :hacks_users
  end
end
