class Filter
    @@FilteredCourses = Course.all
    
    private
    #由课程编号提供的条件的筛选
    def self.condition_code(cond, method)
        temp = []
        @@FilteredCourses.each do |x|
            if (Hashes.send(method, x.course_code) == cond)
                temp << x
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #只列出所要求学院的课程
    def self.filter_department(department_id)
        self.condition_code(department_id, :code_depart)
    end
    
    private
    #只列出所要求授课对象的课程
    def self.filter_for(for_id)
        self.condition_code(for_id, :code_for)
    end
    
    private
    #只列出所要求课程类型的课程
    def self.filter_property(property_id)
        self.condition_code(property_id, :code_prop)
    end
    
    private
    #只列出所要求校区的课程
    def self.filter_campus(campus_id)
        self.condition_code(campus_id, :code_campus)
    end
    
    private
    #教学楼是否匹配
    def self.building_match(operator, b_name)
        temp = []
        @@FilteredCourses.each do |x|
            if (x.building.send(operator, b_name))
                temp << x
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #按教学楼筛选课程
    def self.filter_building(build_id)
        if (build_id == "all" or build_id == "other")
            if (build_id == "other")
                self.building_match(:!=, "教")
                self.building_match(:!=, "教1")
                self.building_match(:!=, "教2")
                self.building_match(:!=, "学园1")
                self.building_match(:!=, "学园2")
                self.building_match(:!=, "学园3")
                self.building_match(:!=, "学园4")
                self.building_match(:!=, "N")
                self.building_match(:!=, "S")
            end
        else
            self.building_match(:==, build_id)
        end
    end
    
    private
    #按学分筛选课程
    def self.credit_condition(operator, credit)
        temp = []
        @@FilteredCourses.each do |x|
            if (x.credit.send(operator, credit))
                temp << x
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #只列出所要求学分的课程
    def self.filter_credit(op_str, credit)
        case op_str
        when "eq"
            self.credit_condition(:==, credit)
        when "ge"
            self.credit_condition(:>=, credit)
        when "gt"
            self.credit_condition(:>, credit)
        when "le"
            self.credit_condition(:<=, credit)
        when "ls"
            self.credit_condition(:<, credit)
        when "ne"
            self.credit_condition(:!=, credit)
        end
    end
    
    private
    #按星期筛选课程
    def self.filter_weekday(weekday_id)
        temp = []
        @@FilteredCourses.each do |x|
            t = x.course_time.split
            t.each do |t_time|
                if (t_time[0, 1] == weekday_id)
                    temp << x
                    break
                end
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #上课节次的匹配
    def self.lesson_match(precise, user_str, data_str)
        if (precise)
            if (user_str == data_str[1,4])
                return true
            else
                return false
            end
        else
            if (user_str[0,2].to_i <= data_str[1,2].to_i and user_str[2,2].to_i >= data_str[3,2].to_i)
                return true
            else
                return false
            end
        end
    end
    
    private
    #按上课节次筛选课程
    def self.filter_lesson(lesson_str, precise)
        temp = []
        @@FilteredCourses.each do |x|
            t = x.course_time.split
            t.each do |t_time|
                if (self.lesson_match(precise, lesson_str, t_time))
                    temp << x
                    break
                end
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #判断单个上课时间是否冲突
    def self.clash_test1(time1, time2)
        if (time1[0,1].to_i == time2[0,1].to_i)
            if (time1[3,2].to_i >= time2[1,2].to_i and time2[3,2].to_i >= time1[1,2].to_i)
                return true
            else
                return false
            end
        else
            return false
        end
    end
    
    private
    #判断上课时间是否冲突
    def self.clash_tests(time1_str, time2_str)
        time1s = time1_str.split
        time2s = time2_str.split
        time1s.each do |x|
            time2s.each do |y|
                if self.clash_test1(x, y)
                    return true
                end
            end
        end
        return false
    end
    
    private
    #仅列出不冲突课程
    def self.filter_clash
        temp = []
        exist_time = []
        $SelectedCourses.each do |x|
            exist_time << x.course_time
        end
        @@FilteredCourses.each do |x|
            clash_flag = false
            exist_time.each do |y|
                if self.clash_tests(x.course_time, y)
                    clash_flag = true
                    break
                end
            end
            unless clash_flag
                temp << x
            end
        end
        @@FilteredCourses = temp
    end
    
    private
    #执行一个筛选模式
    def self.pattern_run(pattern)
        pat_type = pattern[0,1]
        remain_str = pattern[1, pattern.length - 1]
        case pat_type
        when "a"
            filter_for(remain_str)
        when "b"
            filter_department(remain_str)
        when "c"
            filter_property(remain_str)
        when "d"
            filter_campus(remain_str[0,1])
            remain_str = remain_str[1, remain_str.length - 1]
            filter_building(remain_str)
        when "e"
            filter_weekday(remain_str)
        when "f"
            precise = false
            if (remain_str[0,1] == "P")
                precise = true
            end
            remain_str = remain_str[1, remain_str.length - 1]
            filter_lesson(remain_str, precise)
        when "g"
            op = remain_str[0,2]
            remain_str = remain_str[2, remain_str.length - 2]
            filter_credit(op, remain_str.to_f)
        when "h"
            filter_clash
        end
    end
    
    public
    #筛选
    def Filter.filter(filter_string)
        @@FilteredCourses = Course.all
        patterns = filter_string.split
        patterns.each do |p|
            self.pattern_run(p)
        end
    end
    
    #获取筛选后的课程
    def Filter.filtered_courses
        @@FilteredCourses
    end
end