class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list, :search]
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

=begin
  #modified by liqingjian
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

  #modified end
=end
  #-------------------------for students----------------------

  def list
    if params[:department] == nil
      params[:department] = '0'
    end

    if params[:week] == nil
      params[:week] = '0'
    end

    if params[:course_time] == nil
      params[:course_time] = '0'
    end

    if params[:course_name] == nil
      params[:course_name] = ''
    end

    if params[:authenticity_token] == nil
      params[:authenticity_token] = ''
    end

    search_string = "true"
    if params[:submit] != nil
      params[:page] = 1   #每次查询都是从第一页开始的
      if params[:department] != '0'
        search_string += " and department = '" + params[:department] + "'"
      end
      if params[:week] != '0'
        search_string += " and course_day = '" + params[:week] + "'"
      end
      if params[:course_time] != '0'
        search_string += " and course_class = '" + params[:course_time] + "'"
      end
      if params[:course_name] != nil
        #模糊查询
        search_string += " and name like '%" + params[:course_name] + "%'"
      end
    end


    @course = Course.joins(:course_infos).where(search_string)
    @course=@course-current_user.courses

    #----------分页功能的实现---------#
    total = @course.count
    params[:total] = total
    if(params[:page] == nil)
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



  end

  def close
    @course=Course.find_by_id(params[:id])
    @course.open=false
    @course.save
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end
  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
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
