class AddQuantityToProjectSkillsets < ActiveRecord::Migration[5.2]
  def change
    add_column :project_skillsets, :quantity, :integer
  end
end
