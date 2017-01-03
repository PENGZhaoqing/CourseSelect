class AddCourseStateToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_state, :string
    #增加课程状态，允许为空。
    #课程状态分为：agreed(同意)；disagreed(不同意)
    #processing(待处理)
  end
end
