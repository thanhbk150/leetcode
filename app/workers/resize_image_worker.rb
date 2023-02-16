# frozen_string_literal: true

class ResizeImageWorker < ApplicationWorker
  def perform
    Rails.logger.info "====== ResizeImageWorker ======"
    image_ids = []
    Image.not_resize.each do |img|
      img.file_path.is_live = true
      img.file_path.recreate_versions! :cover
      image_ids << img.id
    end

    Image.where(id: image_ids).update_all(has_resize: true) if image_ids
  end
end
