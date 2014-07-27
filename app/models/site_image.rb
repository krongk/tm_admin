class SiteImage < ActiveRecord::Base
  belongs_to :site_page

  has_attached_file :image,
                    :path => ":class/:id/:style.:extension",
                    :styles => {:original => '320x480#'} #override the original file
                    #:styles => { :content => '640x960>' } #standerd mobile size: 320*480 480*800 640*960
end
