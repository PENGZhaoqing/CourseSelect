class Course < ActiveRecord::Base

  has_many :grades
  has_many :users, through: :grades

  belongs_to :teacher, class_name: "User"

<<<<<<< HEAD
  validates :name, :course_time, :start_week, :end_week, :building,
            :class_room, :period, :credit, :teaching_type, :exam_type, presence: true, length: {maximum: 50}
end

#the Course Time and Operation
class CourseTime 
  attr_accessor:start_week,:end_week,:re_course
  attr_accessor:course_time_pair_list
  
  def ChangeStringToPairlist course_time;
    time_fix_list=course_time.split;
    course_time_pair_list=Array.new
    time_fix_list.each do |time_fix|
      course_time_pair_list << TimePair.new(time_fix);
    end
    return course_time_pair_list;
  end
  
  def initialize course
    @re_course=course
    @start_week=course.start_week
    @end_week=course.end_week
    @course_time_pair_list=ChangeStringToPairlist course.course_time
  end
  
  def DectConflictByCourse course_other;
    if self.start_week>course_other.end_week
      return false;
    end
    if self.end_week<course_other.start_week
      return false;
    end
    @course_time_pair_list.each do |this_time_pair|
      course_other.course_time_pair_list.each do |other_time_pair|
        if this_time_pair.IsHaveOverLap? other_time_pair
          return true
        end
      end
    end
    return false
  end
  
  def DectConflictByList course_list;
    re_course_list=Array.new
    course_list.each do |course|
      if DectConflictByCourse (CourseTime.new (course))
        re_course_list << course
      end
    end
    return re_course_list
  end
end
=======
  validates :course_code, :name, 
            :course_time, :start_week, :end_week,  :building, :class_room, :period, :credit, 
            :teaching_type, :exam_type, presence: true, length: {maximum: 50}
  
  validates :course_department, :course_firstlevel, :teaching_object, :course_type, :campus, length:{maximum:50}
>>>>>>> 0bf9ed440487805a1fa2817839880173d3640fec

# use string 4 long string to the pair of time 
class TimePair
  attr_accessor:start_time,:end_time;
  def initialize fix_time;
    fix_time=~/([0-9])([0-9][0-9])([0-9][0-9])/;
    @start_time=($1+$2).to_i;
    @end_time=($1+$3).to_i;
  end
  def IsHaveOverLap? course_time_pair;
    if self.start_time>course_time_pair.end_time or self.end_time<course_time_pair.start_time;
      return false;
    else
      return true;
    end
  end
end
  