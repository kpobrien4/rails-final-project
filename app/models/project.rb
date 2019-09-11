class Project < ApplicationRecord
    belongs_to :user
    has_many :project_skillsets
    has_many :skillsets, through: :project_skillsets
end