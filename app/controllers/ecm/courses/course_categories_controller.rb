class Ecm::Courses::CourseCategoriesController < ::FrontendController
  def index
    @course_categories = Ecm::Courses::CourseCategory.all
  end
  
  def show
    @year = params[:year] ||= Time.zone.now.year
    @month = params[:month] ||= Time.zone.now.month

    @date = Date.strptime("#{@month}-#{@year}", "%m-%Y")
    
    @course_category = Ecm::Courses::CourseCategory.includes(:ecm_courses_courses => [ :ecm_courses_course_dates ]).find(params[:id])
    @courses = @course_category.ecm_courses_courses.all
    @course_dates = @courses.reduce([]) { |cd, c| cd << c.ecm_courses_course_dates.for_month(@date).all }.flatten  
  end
end
