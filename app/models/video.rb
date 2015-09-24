class Video < ActiveRecord::Base
  belongs_to :user
  mount_uploader :media, VideoUploader

end
