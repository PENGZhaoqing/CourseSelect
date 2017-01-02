class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list]
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

  #-------------------------for students----------------------

  def list
     #   按照关键词（课程名称、教师名）或者下拉列表进行查询
    @course = Course.all

    @param1 =  params[:queryKeyword_1]   #课程名
    @param2= params[:queryKeyword_2]  #department
    @param3= params[:queryKeyword_3] #credit/hour
    @param4 =params[:queryKeyword_4] #type
    @param5= params[:queryKeyword_5] #exam
    if @param1.nil? ==  false and @param1 != ''
      @course = Course.where("name like '%#{@param1}%'")  
    end  
    if @param2.nil? == false and @param2 != ''
      @course = @course.where("course_code like '#{@param2}%'")
    end
    if @param3.nil? == false and @param3 != ''
      @course = @course.where("credit like '#{@param3}'")
        end
    if @param4.nil? == false and @param4 != ''
      @course = @course.where("course_type like '#{@param4}'")
        end
    if @param5.nil? == false and @param5 != ''
     @course = @course.where("exam_type like '#{@param5}'")
    end

    @course=@course-current_user.courses
    
  end
  
  def public_list 
    @course=Course.all
  end
  

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

 def filter
    redirect_to list_courses_path(params)
 end
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
