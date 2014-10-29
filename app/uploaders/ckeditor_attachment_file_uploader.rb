class CkeditorAttachmentFileUploader < BaseUploader
  include Ckeditor::Backend::CarrierWave

  def store_dir
    "uploads/ckeditor/attachments/#{model.id}"
  end

  def cache_dir
    "caches/ckeditor/attachments/#{model.id}"
  end

  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
