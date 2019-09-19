class AddSkillsetRatingToProjectSkillsets < ActiveRecord::Migration[5.2]
  def change
    add_column :project_skillsets, :skillset_rating, :integer
  end
end
