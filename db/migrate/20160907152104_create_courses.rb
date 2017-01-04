class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

      t.string :name
      t.string :course_code
      t.string :course_department  #开课院系
      t.string :course_firstlevel  #一级学科
      t.string :teaching_object    #授课对象
      t.string :course_type    #课程属性
      t.string :teaching_type   
      t.string :exam_type
      t.integer :period           #学时
      t.float :credit              #string->float
      t.integer :limit_num
      t.integer :student_num, default: 0
      t.string :campus            #校区
      t.string :building          #教学楼
      t.string :class_room
      t.string :course_time       #字段不变，但内容改变
      t.integer :start_week       #开始周
      t.integer :end_week         #结束周
      t.text    :description, default: ""      #课程简介
      t.boolean :open, default: true
      t.belongs_to :teacher

      t.timestamps null: false
    end
  end
end
