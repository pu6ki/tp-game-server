class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.text :code, limit: 16.megabytes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
