class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list, :schedule, :matchtime]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update]
  before_action :logged_in, only: :index

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
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
    current_user.courses<<@course
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def schedule
    @course=current_user.courses
=begin    @courselist=Array.new(11){Array.new(7)}
    @course.each do |course|
      if course.course_time.length>5
        temp_str=course.course_time.split
        i=temp_str[0].to_i/10000
        j=temp_str[0].to_i/100%10
        @courselist[i][j]<<@course
        i=temp_str[1].to_i/10000
        j=temp_str[1].to_i/100%10
        @courselist[i][j]<<@course
      end
      if course.course_time.length<=5 
        i=course.course_time.to_i/10000
        j=course.course_time.to_i/100%10
        @courselist[i][j]<<@course
      end
=end    end
  end

  def quit
    @course=Course.find_by(id:params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
=begin
  def matchtime (weekday,begintime)
    @course=current_user.courses
    @course.each do |course|
      if course.course_time.length>5 
        temp_str=course.course_time.split
        if temp_str[0]/10000==weekday
          if temp_str[0]/100%10==begintime
            matchcourse<<@course
          end
        end
        elsif temp_str[1]/10000==weekday
          if temp_str[1]/100%10==begintime
            matchcourse<<@course
          end
      
      end
      if course.course_time.length<=5 
        if course.course_time/10000==weekday
          if course.course_time.to_i/100%10==begintime
            matchcourse<<@course
          end
        end
      end
    end
  end 
=end

  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
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
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week)
  end

end
