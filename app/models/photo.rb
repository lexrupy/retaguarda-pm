class Photo < ActiveRecord::Base
  belongs_to :apenado
  mount_uploader :image, ImageUploader
end
