class Ecm::Courses::CourseDatesController < ::FrontendController
  def index
    @course_dates = Ecm::Courses::CourseDate.includes(:ecm_courses_course => [ :ecm_courses_course_category ]).all
  end
  
  def show
    @course_date = Ecm::Courses::CourseDate.includes(:ecm_courses_course => [ :ecm_courses_course_category ]).find(params[:id])
  end  
end
