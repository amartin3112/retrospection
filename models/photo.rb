class Photo < ActiveRecord::Base
    validates :image_url, length: { in: 10..2048 }
    belongs_to :user
    belongs_to :event
end