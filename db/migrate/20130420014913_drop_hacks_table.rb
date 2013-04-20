class DropHacksTable < ActiveRecord::Migration
  def up
    drop_table :hacks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
