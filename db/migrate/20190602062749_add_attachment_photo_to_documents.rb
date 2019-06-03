class AddAttachmentPhotoToDocuments < ActiveRecord::Migration[5.2]
  def self.up
    change_table :documents do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :documents, :photo
  end
end
