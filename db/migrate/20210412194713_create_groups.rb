class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
