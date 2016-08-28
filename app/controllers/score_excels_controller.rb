class ScoreExcelsController < ApplicationController

  before_action :admin_login
  before_action :check_params, only: :create

  def create
    @score_excel = ScoreExcel.create(excel_params)
    flash="文件:#{@score_excel.file_file_name} 已经成功上传"
    redirect_to score_excels_path, flash: {success: flash}
  end

  def parse
    @score_excel=ScoreExcel.find_by(id: params[:id])
    workbook=Roo::Spreadsheet.open(@score_excel.file.path)
    workbook.default_sheet = workbook.sheets[0]
    ((workbook.first_row + 1)..workbook.last_row).each do |row_index|

      # score.student_name=workbook.row(row_index)[1]
      # score.student_num=workbook.row(row_index)[2]
      # score.class=workbook.row(row_index)[3]
      # score.class_num=workbook.row(row_index)[4]
      # score.grade=workbook.row(row_index)[5]

      student_name=Faker::Name.name
      student_num=Faker::Number.number(10)
      class_name=Faker::University
      class_num=Faker::Number.number(10)
      grade=Faker::Number.between(0, 100)

      Score.create(student_name: student_name, student_num: student_num, class_name: class_name, class_num: class_num, grade: grade)
    end
    redirect_to score_excels_path, flash: {success: "Excel文件中的数据已解析"}
  end

  def clean
    Score.delete_all
    redirect_to score_excels_path, flash: {success: "遴选数据已清空"}
  end

  def index
    @score_excels=ScoreExcel.paginate(:page => params[:page], :per_page => 8).order('created_at DESC')
  end

  def destroy
    @score_excel=ScoreExcel.find_by(id: params[:id])
    flash="文件: #{@score_excel.file_file_name} 已被成功删除"
    @score_excel.destroy
    redirect_to score_excels_path, flash: {success: flash}
  end

  private

  def check_params
    if params[:score_excel].nil?
      flash="请选择要上传的文件"
      redirect_to score_excels_path, flash: {warning: flash}
    elsif !["application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/octet-stream"]
               .include?(params[:score_excel][:file].content_type)
      flash="请上传excel格式的文件(xlsx/xlsm)"
      redirect_to score_excels_path, flash: {danger: flash}
    end
  end

  def excel_params
    params.require(:score_excel).permit(:file)
  end

  def admin_login
    admin?(current_user)
  end

end


