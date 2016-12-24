class Depart < ActiveRecord::Base
  has_many :courses, foreign_key: :department
  has_many :users, foreign_key: :department

  validates :dept_name, :dept_contact, :dept_office, presence: true
end