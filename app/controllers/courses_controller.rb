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
    @course.update_attributes(:open=>true)
    redirect_to courses_path, flash: {:success => "已经成功开放该课程:#{ @course.name}"}
  end

  def close
    @course = Course.find_by_id(params[:id])
    @course.update_attributes(:open=>false)
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end
  
  def courseplan
      @course=Course.find_by_id(params[:id])
  end

  #-------------------------for students----------------------



  def list
     #   按照关键词（课程名称、教师名）或者下拉列表进行查询
    @course = Array.new
    @queryType = params[:queryType].to_i
    if @queryType.nil? == false
     @queryinfo = params[:query]
     if @queryinfo.nil? == false
        if @queryType == 2 
            @course = Course.where("name like '%#{@queryinfo}%'")  
        elsif @queryType == 10
            @teacherName = User.where("name like '%#{@queryinfo}%'")
            @teacherName.each do |teacherSingle|
                teacherSingle.teaching_courses.each do |courseSingle|
                    @course.push courseSingle
                end
            end
        elsif @queryType == 1
            @course = Course.where("course_code like '#{@queryinfo}%'")
        elsif @queryType == 3
            @course = Course.where("credit like '#{@queryinfo}'")
        elsif @queryType == 4
            @course = Course.where("course_type like '#{@queryinfo}'")
        elsif @queryType == 5
            @course = Course.where("teaching_type like '#{@queryinfo}'")
        elsif @queryType == 6
            @course = Course.where("exam_type like '#{@queryinfo}'")
        elsif @queryType == 7
            @course = Course.where("class_room like '#{@queryinfo}'")
        elsif @queryType == 8
            @course = Course.where("course_week like '#{@queryinfo}'")
        elsif @queryType == 9
            @course = Course.where("course_time like '#{@queryinfo}'")    
        else
            @course = Course.all
        end
     else
         @course=Course.all 
     end
    else
        @course = Course.all
    end
   
    
    @course=@course-current_user.courses
    @course_true = Array.new
    @course.each do |single|
      if single.open then
        @course_true.push single
      end
    end
  end

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    @grades=current_user.grades.find_by(course_id: params[:id])
    @grades.update_attributes(:degree => false)
    flash={:success => "成功选择该课程为非学位课: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def selectasdegree
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    @grades=current_user.grades.find_by(course_id: params[:id])
    @grades.update_attributes(:degree => true)
    flash={:success => "成功选择课程为学位课: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def credittips
    @courses=current_user.courses
    @grades=current_user.grades
    @chosen_credit_all = 0.0
    @chosen_credit_public = 0.0
    @chosen_credit_major = 0.0
    @courses.each do |course|
      @chosen_credit_all = @chosen_credit_all+ course.credit[-3..-1].to_f
      if course.course_type == "公共选修课" then
         @chosen_credit_public = @chosen_credit_public+course.credit[-3..-1].to_f
      end
      if course.course_type == "专业核心课" then
         @chosen_credit_major = @chosen_credit_major+course.credit[-3..-1].to_f
      end
    end
    
   @obtained_credit_pubic = 0.0
   @obtained_credit_major = 0.0
   @obtained_credit_all = 0.0
   @grades.each do |grade|
      if grade.grade.nil? == false
         @obtained_credit_all += grade.course.credit[-3..-1].to_f
         if grade.course.course_type == "公共选修课"
            @obtained_credit_public += grade.course.credit[-3..-1].to_f
         end
         if grade.course.course_type == "专业核心课"
             @obtained_credit_major += grade.course.credit[-3..-1].to_f
         end
      end
   end
  end
  
 
 def filter
    redirect_to list_courses_path(params)
    
 end
 
 def modifydegree
    @grades=current_user.grades.find_by(course_id: params[:id])
    if @grades.degree then
      @grades.update_attributes(:degree => false)
      flash={:success => "更改为非学位课"}
    else
      @grades.update_attributes(:degree => true)
      flash={:success => "更改为学位课"}
    end
    redirect_to courses_path, flash: flash
 end

  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
    
    @course_all=Course.all
    @course_all=@course_all-@course
    @course_true = Array.new
    @course_all.each do |single|
      if single.open then
        @course_true.push single
      end
    end
  end


  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登录'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登录'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登录'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week)
  end


end