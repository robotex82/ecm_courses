class Ecm::Courses::CourseCategory < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_course_categories'
  
  # attributes
  attr_accessible :description, :ecm_courses_courses_count, :locale, :name, :parent_id, :position, :slug
  
  # awesome nested set
  acts_as_nested_set
  
  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  # validations
  validates :name, :presence => true, :uniqueness => { :scope => [ :parent_id ] }
  validates :locale, :presence => true, :if => :root?
  validates :locale, :absence => true, :unless => :root? 
end
