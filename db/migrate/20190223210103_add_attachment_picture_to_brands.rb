class AddAttachmentPictureToBrands < ActiveRecord::Migration[5.1]
  def self.up
    change_table :brands do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :brands, :picture
  end
end
