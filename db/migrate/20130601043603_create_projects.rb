class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :user
      t.string :link

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
