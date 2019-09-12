class User < ApplicationRecord
    has_many :projects
    has_many :skillsets
    has_many :project_skillsets, through: :projects
    
    validates :email, presence: true, uniqueness: true
    has_secure_password

    def get_email
        self.email.gsub(/\@.*/, "")
    end
end
