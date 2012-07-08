class Ecm::Courses::Course < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_courses'
  
  # acts as list
  acts_as_list :scope => :ecm_courses_course_category
  
  # associations
  belongs_to :ecm_courses_course_category, 
             :class_name => Ecm::Courses::CourseCategory, 
             :counter_cache => :ecm_courses_courses_count
             
  has_many :ecm_courses_course_dates, 
           :class_name => Ecm::Courses::CourseDate, 
           :dependent => :destroy,
           :foreign_key => :ecm_courses_course_id,
           :order => 'start_at'
  
  # attibutes
  attr_accessible :description, 
                  :ecm_courses_course_category_id, 
                  :locale, 
                  :name
#                  :name, 
#                  :position, 
#                  :slug

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
    
  # validations 
  validates :ecm_courses_course_category, :presence => true
  validates :locale, :inclusion => { :in => I18n.available_locales.map(&:to_s) }, :unless => Proc.new { |c| c.locale.blank? }
  validates :name, :presence => true
  
  # public methods
  def to_s
    "#{ecm_courses_course_category.name} - #{name}"
  end  
end
