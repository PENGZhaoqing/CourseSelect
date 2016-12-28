class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.integer :grade
      #apply = 0 表示教师发布成绩，apply = 1 表示为发布成绩
      t.boolean :apply, :default => false
      t.timestamps null: false
    end
  end
end
