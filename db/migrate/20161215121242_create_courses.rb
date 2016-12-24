class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

      t.string :name
      t.string :course_code
      t.string :course_type
      t.string :teaching_type
      t.string :exam_type
      t.string :credit
      t.integer :limit_num
      t.integer :student_num, default: 0
      t.string :class_room
      t.string :course_time
      t.string :course_week
      t.integer :department
      t.string :academic_year
      t.string :semester
      t.text :description
      t.string :apply #0正常课程 1增课申请 2修改课程申请 3删除课程申请
      t.belongs_to :teacher


      t.timestamps null: false
    end
  end
end

