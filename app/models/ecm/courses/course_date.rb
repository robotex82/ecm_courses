class Ecm::Courses::CourseDate < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_course_dates'
  
  # associations
  belongs_to :ecm_courses_course,
             :class_name => Ecm::Courses::Course,
             :counter_cache => :ecm_courses_course_dates_count
             
  has_one :ecm_courses_course_category,
          :class_name => Ecm::Courses::CourseCategory, 
          :through => :ecm_courses_course             
  
  # attributes
  attr_accessible :description, 
                  :ecm_courses_course_id, 
                  :end_at, 
 #                 :slug, 
                  :start_at
                  
  # callbacks
  after_initialize :set_defaults
                  
  # validations
  validates :ecm_courses_course, :presence => true                  
  validates :end_at, :presence => true
  validates :start_at, :presence => true
  
  # public methods
  def duration_in_minutes
    ((self.end_at) - (self.start_at)).to_i / 60
  end  
  
  def to_s
    "#{I18n.l(start_at)} - #{I18n.l(end_at)}"
  end
  
  # class methods
  def self.for_month(date)
    date ||= Time.zone.now.to_date
    where(:start_at => (date.beginning_of_month..(date.end_of_month + 1.day)))
  end
  
  # protected methods
  protected
    def set_defaults
      if self.new_record?
        self.start_at ||= 6.hours.from_now.change( :min => 0 )
        self.end_at ||= self.start_at + 1.hours
      end
    end
end
