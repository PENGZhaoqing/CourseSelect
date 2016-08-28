class Score < ActiveRecord::Base

  def self.search(params)
    where('scores.student_name LIKE ?', "%#{params[:student_name]}%")
        .where('scores.student_num LIKE ?', "%#{params[:student_num]}%")
        .where('scores.class_name LIKE ?', "%#{params[:class]}%")
        .where('scores.class_num LIKE ?', "%#{params[:class_num]}%")
  end

end
