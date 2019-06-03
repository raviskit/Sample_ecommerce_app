class Document < ApplicationRecord
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\A*.*\z/
end
