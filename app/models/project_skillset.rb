class ProjectSkillset < ApplicationRecord
    belongs_to :project 
    belongs_to :skillset
end