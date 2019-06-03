class Document < ApplicationRecord
  has_attached_file :photo, styles: lambda { |a|
    if a.instance.is_image?
      {thumb: "150x150>"}
    elsif a.instance.is_pdf?
      {} #style must have hash to execute styles.dup
    end
  }
  validates_attachment_content_type :photo, content_type: /\A*.*\z/

  def is_pdf?
    self.photo_content_type =~ %r(pdf)i ? true : false
  end
  def is_image?
    self.photo_content_type =~ %r(image)i ? true : false
  end
end
