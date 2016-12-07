class Department < ActiveRecord::Base
  has_one :course, foreign_key: :department
  has_one :user, foreign_key: :department_id

  validates :dept_name, :dept_contact, :dept_office, presence: true
end