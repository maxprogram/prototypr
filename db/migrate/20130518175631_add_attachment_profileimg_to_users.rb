class AddAttachmentProfileimgToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profileimg
    end
  end

  def self.down
    drop_attached_file :users, :profileimg
  end
end
