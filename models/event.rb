class Event < ActiveRecord::Base
    validates :title, :start_at, :end_at, presence: true
    belongs_to :user
    has_many :photos
end