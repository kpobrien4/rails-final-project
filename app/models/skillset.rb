class Skillset < ApplicationRecord
    #belongs_to :user
    has_many :project_skillsets
    has_many :projects, through: :project_skillsets
end
