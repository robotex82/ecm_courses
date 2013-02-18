class Ecm::Courses::CourseCategory < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_courses_course_categories'

  # associations
  has_many :ecm_courses_courses,
           :class_name => Ecm::Courses::Course,
           :dependent => :destroy,
           :foreign_key => :ecm_courses_course_category_id,
           :order => 'position'

  # attributes
  attr_accessible :description,
                  :ecm_courses_courses_count,
                  :locale,
                  :name,
                  :parent_id,
                  :position,
                  :slug

  # awesome nested set
  acts_as_nested_set
  default_scope :order => 'lft ASC'

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :name, :presence => true, :uniqueness => { :scope => [ :parent_id ] }
  validates :locale, :presence => true, :if => :root?
  validates :locale, :inclusion => { :in => I18n.available_locales.map(&:to_s) }, :unless => Proc.new { |cc| cc.locale.blank? }
  validates :locale, :absence => true, :unless => :root?

  # public methods
  def index_name
    if self.root?
      "[#{self.locale}] #{self.name}"
    else
      "#{'&#160;&#160;&#160;&#160;' * self.level} |--&#160;#{self.name}".html_safe
    end
  end

  def to_s
    name
  end

  def tree_name
    root_prefix = (self.root?) ? "[#{self.locale}] " : ""

    if ecm_courses_courses_count < 1
      "#{root_prefix}#{to_s}"
    else
      "#{root_prefix}#{to_s} (#{ecm_courses_courses_count})"
    end
  end
end

