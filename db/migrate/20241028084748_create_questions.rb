class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.references :survey, null: false, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
