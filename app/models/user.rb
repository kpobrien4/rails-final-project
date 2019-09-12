class User < ApplicationRecord
    has_many :projects
    has_many :skillsets
    has_many :project_skillsets, through: :projects
    
    validates :email, presence: true, uniqueness: true
    has_secure_password

    def get_email
        self.email.gsub(/\@.*/, "")
    end

    def self.find_or_create_by_omniauth(auth)
        @user = User.find_by(email: auth["info"]["email"])
        if @user.uid.nil?
          @user.update(uid: auth["uid"])
        elsif @user.nil?
          @user = User.create_by(uid: auth["uid"]) do |u|
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex
          end
        end
        @user
      end
end
