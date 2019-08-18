class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }
    has_many :events, dependent: :destroy
    has_many :photos, dependent: :destroy
    has_secure_password
end