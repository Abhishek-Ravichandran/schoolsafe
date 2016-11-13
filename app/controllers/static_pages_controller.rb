class StaticPagesController < ApplicationController
  def home
    filtered = 0
    @schools = []
    if params[:high] == "1" then
      @schools += School.all.select { |x| x.grade_level.downcase.include? "igh" if x.grade_level}
      filtered = 1
    end
    if params[:mid] == "1" then
      @schools += School.all.select { |x| x.grade_level.downcase.include? "mid" if x.grade_level}
      filtered = 1
    end
    if params[:elem] == "1" then
      @schools += School.all.select { |x| x.grade_level.downcase.include? "elem" if x.grade_level}
      filtered = 1
    end
    if params[:pre] == "1" then
      @schools += School.all.select { |x| x.grade_level.downcase.include? "pre" if x.grade_level}
      filtered = 1
    end
    
    @schools = School.all if filtered == 0
  end
  
  def about
  end
end
