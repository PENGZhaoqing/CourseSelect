class TeachersController < ApplicationController

  before_action :correct_user, only: [:update, :destroy]
  before_action :teacher_logged_in, only: :manage_transcript

  def course
    @user=User.find_by_id(params[:id])
    @course=@user.teaching_courses
  end

  def manage_transcript
    @course=Course.find_by_id(params[:id])
    @users=@course.users
  end

  def upload_grade
    @grade=Grade.find_by_id(params[:id])
    if @grade.update_attributes!(:grade => params[:grade][:grade])
      flash={:success => "成绩上传成功"}
    else
      flash={:danger => "上传失败.请重试"}
    end
    redirect_to manage_transcript_teacher_path(params[:course_id]), flash: flash
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :major, :department, :password,
                                 :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url, flash: {:warning => '此操作需要管理员身份'}
    end
  end

  # Confirms a logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

end
