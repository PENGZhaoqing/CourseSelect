class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update]
  before_action :logged_in, only: :index

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
    @course1=Course.new
  end

  def create
    @course = Course.new(course_params)
    get_course_code
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:info] = "请继续"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    get_course_code
    if @course.update_attributes(course_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def open
    @course=Course.find_by_id(params[:id])
    @course.update_attribute(:open,true)
    redirect_to courses_path, flash: {:success => "已经成功开启该课程:#{ @course.name}"}
  end
  
  def close
    @course=Course.find_by_id(params[:id])
    @course.update_attribute(:open,false)
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end
  


  #-------------------------for students----------------------

  def list
    @course=Course.all
    @course=@course.where(open:true).all
    @course=@course-current_user.courses
  end

  def select
    @course=Course.find_by_id(params[:id])
    course_time=CourseTime.new @course
    @@conflict_list=course_time.DectConflictByList(current_user.courses)
    if @@conflict_list.empty?
      current_user.courses<<@course
      flash={:success => "成功选择课程: #{@course.name}"}
      redirect_to courses_path, flash: flash
    else
      flash={:warning => "#{@course.name}  与下列课程冲突"}
      @@change_course=@course
      redirect_to conflict_course_path,flash: flash
    end        
  end
  
  def conflict
    @course=@@conflict_list
  end
  
  def change
    current_user.courses<<@@change_course
    @@conflict_list.each do |course|
      current_user.courses.delete(course)
    end
    flash={:success => "成功选择课程: #{@@change_course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def quit
    @course=Course.find_by(id:params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
  end
  
  def detail
    @course=Course.find_by(id:params[:id])
  end

  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_department, :course_firstlevel, :teaching_object, :course_type, 
                                   :teaching_type, :exam_type,:period, :credit, :limit_num, :campus, :building, :class_room, 
                                   :course_time, :start_week, :end_week)
  end

  def get_course_code
    @course.course_code= @course.course_department[0,2] + @course.course_firstlevel[3,1]+@course.teaching_object[0,1]+@course.course_type[0,1]+"#{params[:id].to_i+100}"+@course.campus[0,1]
  end
end
