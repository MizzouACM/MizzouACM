class PolymorphicAttachments < ActiveRecord::Migration
  def up
  	change_table :attachments do |t|
  	  t.references :attachable, polymorphic: true
    end
  end

  def down
  end
end
