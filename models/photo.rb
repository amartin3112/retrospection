require 'carrierwave'
require 'carrierwave/orm/activerecord'

class AssetUploader < CarrierWave::Uploader::Base
    storage :file
end

class Photo < ActiveRecord::Base
    # validates :image_url, length: { in: 10..2048 }
    validates :asset, presence: true
    belongs_to :user
    belongs_to :event
    mount_uploader :asset, AssetUploader
end