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

  def open
    @course = Course.find_by_id(params[:id])
    @course.update_attribute("open", true)
    redirect_to courses_path, flash: {:success => "已成功开启本课程"}
  end

  def close
    @course = Course.find_by_id(params[:id])
    @course.update_attribute("open", false)
    redirect_to courses_path, flash: {:success => "已成功关闭本课程"}
  end

  #-------------------------for students----------------------

  def list
    @course=Course.all
    #@course = Course.paginate(:page=>params[:page],:per_page=>8)

    @course=@course-current_user.courses
    @course_open = Array.new
    @course.each do |course|
      if(course.open == true)
       @course_open<< course
      end
    end
    @course = @course_open


    #------------分页---------------------
    total = @course.count
    params[:total] = total
    if params[:page] == nil
      params[:page] = 1  #进行初始化
    end
    if total % $PageSize == 0
      params[:pageNum] = total / $PageSize
    else
      params[:pageNum] = total / $PageSize + 1
    end

    #计算分页的开始和结束位置
    params[:pageStart] = (params[:page].to_i - 1) * $PageSize

    if params[:pageStart].to_i + $PageSize <= params[:total].to_i
      params[:pageEnd] = params[:pageStart].to_i + $PageSize - 1
    else
      params[:pageEnd] = params[:total].to_i - 1  #最后一页
    end
    #---------------------------------------------------------------------
    end


  def select
    @course=Course.find_by_id(params[:id])#查找
    current_user.courses<<@course
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash #跳到下一个页面
  end




  #-------------------------for both teachers and students----------------------

  def index
    if teacher_logged_in?
    @course=current_user.teaching_courses.paginate(:page=>params[:page],:per_page=>5)

    end
    if student_logged_in?
    @course=current_user.courses.paginate(:page=>params[:page],:per_page=>5)
    @courses = current_user.courses
    @sum_time = 0
    @sum_credit = 0
    @courses.each do |courses|
     @sum_credit += courses.credit[3...4].to_i
      @sum_time += courses.credit[0...1].to_i
    end
    end
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