class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  hash = Hash.new
  Depart.all.each do |dept|
    hash[dept.id]= {dept_name: dept.dept_name,
                    dept_office: dept.dept_office,
                    dept_contract: dept.dept_contact
    }
  end
  $Department = hash
end
