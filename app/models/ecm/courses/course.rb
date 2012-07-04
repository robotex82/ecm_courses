class Ecm::Courses::Course < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_courses'
  
  # acts as list
  acts_as_list :scope => :ecm_courses_course_category
  
  # associations
  belongs_to :ecm_courses_course_category, 
             :class_name => Ecm::Courses::CourseCategory, 
             :counter_cache => :ecm_courses_courses_count
  
  # attibutes
  attr_accessible :description, 
                  :ecm_courses_course_dates_count, 
                  :locale, 
                  :name, 
                  :position, 
                  :slug

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
    
  # validations 
  validates :ecm_courses_course_category, :presence => true
  validates :locale, :inclusion => { :in => I18n.available_locales.map(&:to_s) }, :unless => Proc.new { |cc| cc.locale.blank? }
  validates :name, :presence => true
end
