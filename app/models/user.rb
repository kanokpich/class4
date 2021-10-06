class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, length: {minimum: 2}
    validates :password, presence: true
    has_many :posts
    has_secure_password
end
