class ChangeFieldName < ActiveRecord::Migration
  def up
  	rename_column :groups, :url, :facebook_path
  end

  def down
  	rename_column :groups, :facebook_path, :url 
  end
end
