class User < ApplicationRecord
    has_many :projects
    has_many :skillsets
    validates :email, presence: true, length: {minimum: 3, maximum: 18}, uniqueness: true
    has_secure_password
end
