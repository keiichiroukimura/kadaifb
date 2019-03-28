class Feed < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    validates :image,:content, presence: true
end
