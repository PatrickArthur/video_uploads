# app/models/user.rb
class User < ActiveRecord::Base
  has_attached_file :attachment, :styles => {
    :medium => { :geometry => "640x480", :format => 'flv' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]
end
