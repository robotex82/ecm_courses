FactoryGirl.define do
  factory :ecm_courses_course_category, :class => Ecm::Courses::CourseCategory do
    sequence(:name) { |i| "Course category ##{i}" }
    locale 'en'

    factory :ecm_courses_course_category_with_parent do
      locale nil
      association :parent, :factory => :ecm_courses_course_category
    end
  end
end

