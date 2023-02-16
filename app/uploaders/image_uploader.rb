# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  storage :file
  process :optimize

  version :thumb do
    process :resize_to_fit => [100, 100]
    process :convert => 'jpg'
  end

  version :cover, :if => :is_live? do
    process :resize_to_fit => [240, 180]
    process :convert => 'jpg'
  end

  before :cache, :save_original_filename

  def store_dir
    "uploads/images"
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end

  # TODO
  # def filename
  #   if model.new_record?
  #     "#{original_filename.delete(".#{file.extension}").downcase}_#{Time.current.to_i}.#{file.extension}"
  #   else
  #     "cover_#{original_filename}"
  #   end
  # end

  def is_live?(img = nil)
    @is_live
  end

  def is_live=(value)
    @is_live = value
  end

  def save_original_filename(file)
    model.original_filename ||= file.original_filename if file.respond_to?(:original_filename)
  end
end
