# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process resize_to_fit(720,720)

  #process :tags => ['post_picture']
  
  version :thumbnail do
    resize_to_fit(120, 120)
  end

end
