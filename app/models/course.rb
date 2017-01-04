class Course < ActiveRecord::Base

  has_many :grades
  has_many :users, through: :grades

  belongs_to :teacher, class_name: "User"

  validates :course_code, :name, 
            :course_time, :start_week, :end_week,  :building, :class_room, :period, :credit, 
            :teaching_type, :exam_type, presence: true, length: {maximum: 50}
  
  validates :course_department, :course_firstlevel, :teaching_object, :course_type, :campus, length:{maximum:50}

end
