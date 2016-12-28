class Depart < ActiveRecord::Base
  has_many :courses, class_name:"Course", foreign_key: :department
  has_many :users, class_name:"User", foreign_key: :department

  validates :dept_name, :dept_contact, :dept_office, presence: true
end