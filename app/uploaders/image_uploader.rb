# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process resize_to_fill(200,200)

  #process :tags => ['post_picture']
  
  version :thumbnail do
    resize_to_fit(100, 100)
  end

end
