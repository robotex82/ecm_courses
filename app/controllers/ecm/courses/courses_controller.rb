class Ecm::Courses::CoursesController < ApplicationController
  def calendar
    @year = params[:year] ||= Time.zone.now.year
    @month = params[:month] ||= Time.zone.now.month

    @date = Date.strptime("#{@month}-#{@year}", "%m-%Y")

    @course = Ecm::Courses::Course.includes(:ecm_courses_course_category, :ecm_courses_course_dates).find(params[:id])
    @course_dates = @course.ecm_courses_course_dates.for_month(@date).all
  end
  
  def index
    @courses = Ecm::Courses::Course.includes(:ecm_courses_course_category, :ecm_courses_course_dates).all
  end
  
  def show
    @course = Ecm::Courses::Course.includes(:ecm_courses_course_category, :ecm_courses_course_dates).find(params[:id])
  end
end
