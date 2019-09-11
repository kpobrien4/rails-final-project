class Project < ApplicationRecord
   # belongs_to :user
    has_many :project_skillsets
    has_many :skillsets, through: :project_skillsets
    validates :title, presence: true
    validates :genre, presence: true
    validates :info, presence: true
    validates :contact, presence: true
end