FactoryGirl.define do
  factory :ecm_courses_course_category, :class => Ecm::Courses::CourseCategory do
    name "Making fire"
    locale I18n.default_locale
      
    factory :ecm_courses_course_category_with_parent do
      locale nil
      association :parent, :factory => :ecm_courses_course_category
    end
  end
end
