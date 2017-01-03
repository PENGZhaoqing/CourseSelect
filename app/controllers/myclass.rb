class Courselist
    @mylist=Array.new(11){Array.new(7)}
    def getlist(course)
        #@course=current_user.courses
        course.each do |course|
            if course.course_time.length>5
                temp_str=course.course_time.split
                i=temp_str[0].to_i/10000
                j=temp_str[0].to_i/100%10
                @mylist[i][j]<<@course
                i=temp_str[1].to_i/10000
                j=temp_str[1].to_i/100%10
                @mylist[i][j]<<@course
            end
            if course.course_time.length<=5 
                i=course.course_time.to_i/10000
                j=course.course_time.to_i/100%10
                @mylist[i][j]<<@course
            end
        end
    end
end