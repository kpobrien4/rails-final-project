class Skillset < ApplicationRecord
    belongs_to :user, optional: true
    has_many :project_skillsets
    has_many :projects, through: :project_skillsets
end
