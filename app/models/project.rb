class Project < ApplicationRecord
    belongs_to :user
    has_many :project_skillsets
    has_many :skillsets, through: :project_skillsets
    
    validates :title, presence: true
    validates :genre, presence: true
    validates :info, presence: true
    validates :contact, presence: true

    scope :search, -> (query) { query ? Project.where("title LIKE ?", "%#{query}%") : Project.all }
    scope :featured_projects, -> {Project.last(2).collect {|project| "#{project.title}, Genre: #{project.genre}"}.join(" <br> ").html_safe}
end