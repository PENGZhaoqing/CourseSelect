class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  #分页大小
  $PageSize = 10   #每页10条记录
  #学院常量
  hash = Hash.new
  hash[0] = {dept_name: '--请选择学院--'}
  Depart.all.each do |dept|
    hash[dept.id]= {dept_name: dept.dept_name,
                    dept_office: dept.dept_office,
                    dept_contract: dept.dept_contact
    }
  end
  $Department = hash

  #星期常量
  $Week = {
      0 => '--请选择星期--',
      1 => '星期一',
      2 => '星期二',
      3 => '星期三',
      4 => '星期四',
      5 => '星期五',
      6 => '星期六',
      7 => '星期日'
  }

  #节次常量
  $ClassTime = {
      0 => '--请选择节次--',
      '1-2' => '上午1-2节',
      '3-4' => '上午3-4节',
      '1-3' => '上午1-3节',
      '2-4' => '上午2-4节',
      '1-4' => '上午1-4节',
      '5-6' => '下午5-6节',
      '7-8' => '下午7-8节',
      '5-7' => '下午5-7节',
      '6-8' => '下午6-8节',
      '5-8' => '下午5-8节',
      '9-10' => '晚上9-10节',
      '9-11' => '晚上9-11节'
  }

end
