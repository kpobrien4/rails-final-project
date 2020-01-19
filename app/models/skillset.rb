class Skillset < ApplicationRecord
    belongs_to :user
    has_many :project_skillsets
    has_many :projects, through: :project_skillsets

    validates :name, presence: true
    validates :skills, presence: true
    validates :info, presence: true
    validates :contact, presence: true

    def self.search(query, user_id)
        if user_id
            user = User.find_by_id(user_id)
            query ? user.skillsets.where("LOWER(skills) LIKE ?", "%#{query.downcase}%") : user.skillsets 
        else
            query ? Skillset.where("skills LIKE ?", "%#{query}%") : Skillset.all
        end
    end
end
