class CkeditorPictureUploader < BaseUploader
  include Ckeditor::Backend::CarrierWave

  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end

  def cache_dir
    "caches/ckeditor/pictures/#{model.id}"
  end

  process :read_dimensions

  version :thumb do
    process :resize_to_fill => [118, 100]
  end

  version :content do
    process :resize_to_limit => [800, 800]
  end

  def extension_white_list
    Ckeditor.image_file_types
  end
end
