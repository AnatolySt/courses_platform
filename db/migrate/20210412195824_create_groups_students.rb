class CreateGroupsStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
