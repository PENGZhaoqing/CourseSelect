class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :student_name
      t.string :student_num
      t.string :class_name
      t.string :class_num
      t.integer :grade

      t.timestamps null: false
    end
  end
end
