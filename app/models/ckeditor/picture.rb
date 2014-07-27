class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :path => ":class/:id/:style.:extension",
                    :styles => { :original => '640x640>', :thumb => '<320x320>' }

  validates_attachment_size :data, :less_than => 5.megabytes
  validates_attachment_presence :data
  #update to version 4.0
  validates_attachment_content_type :data, :content_type => /\Aimage\/.*\Z/

  def url_content
    url(:original)
  end
end
