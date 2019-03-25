class Feed < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    validates :image, presence: true
    validates :content, presence: true
    mount_uploader :image, ImageUploader
end
