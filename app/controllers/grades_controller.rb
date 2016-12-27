class GradesController < ApplicationController

  def update
    @grade=Grade.find_by_id(params[:id])
    if teacher_logged_in?
      if @grade.update_attributes!(:grade => params[:grade][:grade])
        flash={:success => "#{@grade.user.name} #{@grade.course.name}的成绩已成功修改为 #{@grade.grade}"}
      else
        flash={:danger => "上传失败.请重试"}
      end
      redirect_to grades_path(course_id: params[:course_id]), flash: flash
    else
      if @grade.update_attributes!(:rank_course => params[:grade][:rank_course],
                                   :rank_teacher => params[:grade][:rank_teacher],
                                   :rank_comment => params[:grade][:rank_comment])
        flash={:success => "评价提交成功"}
      else
        flash={:danger => "提交失败.请重试"}
      end
      redirect_to :back
    end
  end

  def index
    if teacher_logged_in?
      @course=Course.find_by_id(params[:course_id])
      @grades=@course.grades
    elsif student_logged_in?
      @grades=current_user.grades
    else
      redirect_to root_path, flash: {:warning=>"请先登录"}
    end
  end
  
  def evaluate
    @course=Course.find_by_id(params[:course_id])
    if student_logged_in?
      @grades=current_user.grades.find_by(course_id: params[:course_id])
      @grades_all=@course.grades
    else teacher_logged_in?
      @grades_all=@course.grades
    end
  end

  private

  
  #Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登录'}
    end
  end

  def course_params
    params.require(:grade).permit(:course_id, :user_id, :grade, :degree, :rank_teacher, :rank_course,
                                  :rank_comment)
  end


end
