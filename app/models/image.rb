class Image < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  mount_uploader :file_path, ImageUploader

  validates :user_id, presence: true
  validates :original_filename, presence: true
  validates :file_path, presence: true

  scope :not_resize, -> { where(has_resize: false) }
end
