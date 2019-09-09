class User < ApplicationRecord
    has_many :projects
    has_many :skillsets through :projects
end
