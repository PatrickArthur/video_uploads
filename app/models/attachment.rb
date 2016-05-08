class Attachment < ActiveRecord::Base
  belongs_to :user
  has_attached_file :video, styles: {
    medium: { geometry: '640x480', format: 'flv' },
    thumb: { geometry: '100x100#', format: 'jpg', time: 10 }
  }, processors: [:transcoder]
end
