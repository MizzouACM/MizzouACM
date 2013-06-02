class AddDemoToProject < ActiveRecord::Migration
  def change
    add_column :projects, :demo_link, :string
  end
end
