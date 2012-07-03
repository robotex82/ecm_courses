class Ecm::Courses::CourseCategory < ActiveRecord::Base
  # DB settings
  self.table_name = 'ecm_courses_course_categories'
  
  attr_accessible :description, :ecm_courses_courses_count, :locale, :name, :parent_id, :position, :slug
end
