# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :aws
  
  def default_url
    "/icons/#{model.class.to_s.downcase}_missing.png"
  end
  
  def store_dir
      "images/#{model.class.table_name.singularize.underscore}/#{mounted_as}/#{model.id}"
  end
  
  # version :wide do
  #   process :resize_to_fill => [1200, 500]
  # end
  #
  # version :twelvehundred do
  #   process :resize_to_fit => [1200, 900]
  # end
  
  version :medium do
    process :resize_to_fit => [800, 600]
  end
  
  version :small do
    process :resize_to_fit => [300, 300]
  end
  
  version :box do
    process :resize_to_fill => [400, 400]
  end
  
  version :thumb do
    process :resize_to_fill => [100, 100]
  end
  
end
