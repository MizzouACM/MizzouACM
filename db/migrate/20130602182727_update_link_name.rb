class UpdateLinkName < ActiveRecord::Migration
  def up
  	rename_column :projects, :link, :source_link
  end

  def down
  	rename_column :projects, :source_link, :link
  end
end
