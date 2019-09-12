class Skillset < ApplicationRecord
    belongs_to :user, optional: true
    has_many :project_skillsets
    has_many :projects, through: :project_skillsets

    validates :name, presence: true
    validates :skills, presence: true
    validates :info, presence: true
    validates :contact, presence: true

    scope :search, -> (query) { query ? Skillset.where("skills LIKE ?", "%#{query}%") : Skillset.all }
end
