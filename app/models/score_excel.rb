class ScoreExcel < ActiveRecord::Base
  attr_accessor :file
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["application/vnd.ms-excel","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","application/octet-stream"]

end
