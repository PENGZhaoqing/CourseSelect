class Course < ActiveRecord::Base

  has_many :grades
  has_many :users, through: :grades
  has_many :course_infos, class_name: "CourseInfo", foreign_key: :course_code

  belongs_to :teacher, class_name: "User"
  belongs_to :depart

  validates :name, :course_type, :course_time, :course_week,
            :class_room, :credit, :teaching_type, :exam_type, presence: true, length: {maximum: 50}


end
