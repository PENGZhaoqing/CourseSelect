class Hashes
#院系代码
@@department_map = 
{
  "01" => "数学科学学院",
  "02" => "物理科学学院",
  "03" => "天文与空间科学学院",
  "04" => "化学与化工学院",
  "05" => "材料科学与光电技术学院",
  "06" => "生命科学学院",
  "07" => "地球科学学院",
  "08" => "资源与环境学院",
  "09" => "计算机与控制学院",
  "10" => "电子电气与通信工程学院",
  "11" => "工程科学学院",
  "12" => "经济与管理学院",
  "13" => "公共政策与管理学院",
  "14" => "人文学院",
  "15" => "外语学院",
  "16" => "中丹学院",
  "17" => "国际学院",
  "18" => "存济医学院",
  "19" => "微电子学院",
  "20" => "网络空间安全学院",
  "21" => "未来技术学院",
  "TY" => "体育教研室"
}
def Hashes.department_map
  @@department_map
end

#学科代码
@@subject_map = 
{
  "01" => {"1" => "数学", "2" => "系统科学", "3" => "统计学"},
  "02" => {"1" => "物理学", "2" => "核科学与技术"},
  "03" => {"1" => "天文学"},
  "04" => {"1" => "化学", "2" => "化学工程与技术"},
  "05" => {"1" => "材料科学与工程", "2" => "光学工程", "3" => "机械工程"},
  "06" => {"1" => "生物学"},
  "07" => {"1" => "地球物理学", "2" => "地质学", "3" => "大气科学", "4" => "海洋科学", "5" => "地质资源与地质工程", "6" => "测绘科学与技术"},
  "08" => {"1" => "地理学", "2" => "生态学", "3" => "环境科学与工程", "4" => "农业资源利用"},
  "09" => {"1" => "计算机科学与技术", "2" => "控制科学与工程", "3" => "软件工程"},
  "10" => {"1" => "信息与通信工程", "2" => "电子科学与技术", "3" => "电气工程"},
  "11" => {"1" => "力学", "2" => "动力工程及工程热物理", "3" => "土木工程"},
  "12" => {"1" => "管理科学与工程", "2" => "工商管理", "3" => "应用经济学", "4" => "图书情报与档案管理"},
  "13" => {"1" => "管理科学与工程", "2" => "公共管理", "3" => "法学"},
  "14" => {"1" => "哲学", "2" => "心理学", "3" => "新闻传播学", "4" => "科学技术史"},
  "18" => {"1" => "基础医学", "2" => "药学", "3" => "生物医学工程"},
  "19" => {"1" => "电子与通信工程", "2" => "集成电路工程"},
  "20" => {"1" => "网络空间安全"}
}
def Hashes.subject_map
  @@subject_map
end

#星期
@@weekday_map = {1 => "周一", 2 => "周二", 3 => "周三", 4 => "周四", 5 => "周五", 6 => "周六", 7 => "周日"}
def Hashes.weekday_map
  @@weekday_map
end
#校区
@@campus_map = {"H" => "雁栖湖", "Y" => "玉泉路", "Z" => "中关村"}
def Hashes.campus_map
  @@campus_map
end

#课程属性代码
@@property_map = 
{
  "1" => "一级学科核心课",
  "2" => "一级学科普及课",
  "3" => "一级学科研讨课",
  "4" => "专业核心课",
  "5" => "专业普及课",
  "6" => "专业研讨课",
  "7" => "高级强化课",
  "GB" => "公共必修课",
  "GX" => "公共选修课"
}
def Hashes.property_map
  @@property_map
end

#授课对象
@@for_map = {"M" => "硕士生", "D" => "博士生"}
def Hashes.for_map
  @@for_map
end

  #提取编号中表示院系的字符
  def Hashes.code_depart(code)
    code[0, 2]
  end
  #提取编号中表示学科的字符
  def Hashes.code_subject(code)
    code[2, 1]
  end
  #提取编号中表示校区的字符
  def Hashes.code_campus(code)
    code[8, 1]
  end
  #提取编号中表示课程类型的字符
  def Hashes.code_prop(code)
    if (code[2, 1] == "M" or code[2, 1] == "D")
      code[3, 2]
    else
      code[4, 1]
    end
  end
  #提取编号中表示授课对象的字符
  def Hashes.code_for(code)
    if (code[2, 1] == "M" or code[2, 1] == "D")
      code[2, 1]
    else
      code[3, 1]
    end
  end

  #根据课程编号得院系
  def Hashes.department(code)
    @@department_map[code_depart(code)];
  end
  
  #根据课程编号得学科
  def Hashes.subject(code)
    @@subject_map[code_depart(code)][code_subject(code)]
  end
  
  #数字映射为星期
  def Hashes.weekday(day)
    @@weekday_map[day]
  end
  
  #根据课程编号得校区
  def Hashes.campus(code)
    @@campus_map[code_campus(code)]
  end
  
  #根据课程编号得课程类型
  def Hashes.type(code)
    @@property_map[code_prop(code)]
  end
  
  #根据课程编号得授课对象
  def Hashes.for_whom(code)
    @@for_map[code_for(code)]
  end
  
  #展开上课时间字符串
  def Hashes.time_to_str(course_time)
    ret_str = ""
    temp_time = course_time.split
    temp_time.each do |time_str|
      time_int = time_str.to_i
      day = time_int / 10000
      start_lesson = time_int % 10000 / 100
      end_lesson = time_int % 100
      ret_str = ret_str + Hashes.weekday(day) + "(#{start_lesson}~#{end_lesson}) "
    end
    ret_str
  end
  

end
