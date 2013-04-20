class DropTableHacksUsers < ActiveRecord::Migration
  def up
    drop_table :hacks_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
