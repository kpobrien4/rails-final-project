class User < ApplicationRecord
    has_many :projects
    has_many :skillsets
    validates :email, presence: true, uniqueness: true
    has_secure_password

    def get_email
        self.email.gsub(/\@.*/, "")
      end
end
