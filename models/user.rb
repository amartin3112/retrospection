class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :password, length: { in: 8..20 }
    has_many :events
    has_many :photos
    has_secure_password
end