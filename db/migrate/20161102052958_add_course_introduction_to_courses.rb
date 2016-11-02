class AddCourseIntroductionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_introduction, :string
  end
end
