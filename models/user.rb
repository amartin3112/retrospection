class User < ActiveRecord::Base
    has_many :events
    has_many :photos
    has_secure_password
end