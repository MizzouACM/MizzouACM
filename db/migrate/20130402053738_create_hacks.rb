class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :name
      t.string :source
      t.string :demo
      t.text :description

      t.timestamps
    end
  end
end
