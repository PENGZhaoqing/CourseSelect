class CourseInfo < ActiveRecord::Base
  belongs_to :course

  validates :course_code, :course_class, :course_day, presence: true
end