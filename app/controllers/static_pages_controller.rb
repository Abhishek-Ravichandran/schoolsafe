class StaticPagesController < ApplicationController
  def home
    @schools = School.all
    respond_to do |format|
        format.html
        format.js
    end
  end
  
  def about
  end
  
  def filter
    @schools = []
    some = 0;
    params["chkbox_state"].each_pair { |k, v|
      if v == "1" then
        some = 1
        @schools += School.all.select { |x| x.grade_level.downcase.include? k if x.grade_level}
      end
    }
    @schools = School.all if some == 0

    respond_to do |format|
        format.js
    end
  end
  
  def mapchange
    @schools = []
    some = 0
    params["chkbox_state"].each_pair { |k, v|
      if v == "1" then
        some = 1
        @schools += School.all.select { |x| x.grade_level.downcase.include? k if x.grade_level}
      end
    }
    @schools = School.all if some == 0
    
    @schools = @schools.select { |s|
      s["latitude"].to_f < params["bounds"]["lat_max"].to_f && s["latitude"].to_f > params["bounds"]["lat_min"].to_f && s["longitude"].to_f < params["bounds"]["lng_max"].to_f && s["longitude"].to_f > params["bounds"]["lng_min"].to_f
    }

    respond_to do |format|
        format.js
    end
  end
end
