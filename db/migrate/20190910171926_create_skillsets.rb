class CreateSkillsets < ActiveRecord::Migration[5.2]
  def change
    create_table :skillsets do |t|
      t.string :name
      t.string :skills
      t.text :info
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
  end
end
