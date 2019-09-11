class CreateProjectSkillsets < ActiveRecord::Migration[5.2]
  def change
    create_table :project_skillsets do |t|
      t.integer :project_id
      t.integer :skillset_id

      t.timestamps
    end
  end
end
