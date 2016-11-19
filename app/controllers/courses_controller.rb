class CoursesController < ApplicationController


  before_action :student_logged_in, only: [:select, :quit, :list]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update, :open, :close]
  before_action :logged_in, only: [:index]


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
    @course.update_attributes(open:true)
    redirect_to courses_path, flash: {:success => "已经成功开启该课程:#{ @course.name}"}
  end

  def close
    @course=Course.find_by_id(params[:id])
    @course.update_attributes(open:false)
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end

  #-------------------------for students----------------------

  def list
    @course=Course.all
    @course_open=Course.where("open = ?", true)
    @course_open=@course_open-current_user.courses
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


  def detail
    @course=Course.find_by_id(params[:id])
  end

<<<<<<< Updated upstream
=======
  def search
    temp="%"+params[:name]+"%"
    @theparams=Course.find_by_id(1)
    @course=Course.all
    @course_open=Course.where("name like ? AND open =?", temp ,true)
    @course_close=Course.where("name like ? AND open =?", temp ,false)

    if params[:teaching_type]!=""
        @course_open=@course_open.where("teaching_type =?", params[:teaching_type])
        @course_close=@course_close.where("teaching_type =?", params[:teaching_type])
    end
    if params[:course_type]!=""
      @course_open=@course_open.where("course_type =?", params[:course_type])
      @course_close=@course_close.where("course_type =?", params[:course_type])
    end
    if params[:credit]!=""
      @course_open=@course_open.where("credit =?", params[:credit])
      @course_close=@course_close.where("credit =?", params[:credit])
    end
    if params[:exam_type]!=""
      @course_open=@course_open.where("exam_type =?", params[:exam_type])
      @course_close=@course_close.where("exam_type =?", params[:exam_type])
    end
    @course_open=@course_open-current_user.courses
    @course_close=@course_close-current_user.courses
    @theparams=params
    render 'list'
  end

  def refresh_search
    @course=Course.all
    @course_open=Course.where("open = ?", true)-current_user.courses
    @course_close=@course-@course_open
    @theparams=params
    render 'list'
  end
>>>>>>> Stashed changes

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
    params.require(:course).permit(:course_code, :avatar, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week, :course_introduction)
  end



end
