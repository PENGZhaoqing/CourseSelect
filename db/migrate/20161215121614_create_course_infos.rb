class CreateCourseInfos < ActiveRecord::Migration
  def change
    create_table :course_infos do |t|
      t.integer :course_code
      t.string :course_day #星期几有课
      t.string :course_class #节次
      t.timestamps null: false

    end
  end
end
