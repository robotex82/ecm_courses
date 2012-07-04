class Ecm::Courses::CourseDate < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_course_dates'
  
  # associations
  belongs_to :ecm_courses_course,
             :class_name => Ecm::Courses::Course,
             :counter_cache => :ecm_courses_course_dates_count
  
  # attributes
  attr_accessible :description, 
                  :ecm_courses_course_id, 
                  :end_at, 
 #                 :slug, 
                  :start_at
                  
  # validations
  validates :ecm_courses_course, :presence => true                  
  validates :end_at, :presence => true
  validates :start_at, :presence => true
end
