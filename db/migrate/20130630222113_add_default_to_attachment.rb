class AddDefaultToAttachment < ActiveRecord::Migration
  def up
    add_column :attachments, :default, :boolean
  end
  def down
    remove_column :attachments, :defualt
  end
end
