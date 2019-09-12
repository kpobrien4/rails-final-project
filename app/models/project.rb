class Project < ApplicationRecord
    belongs_to :user, optional: true
    has_many :project_skillsets
    has_many :skillsets, through: :project_skillsets
    
    validates :title, presence: true
    validates :genre, presence: true
    validates :info, presence: true
    validates :contact, presence: true

    scope :search, -> (query) { query ? Project.where("title LIKE ?", "%#{query}%") : Project.all }
end