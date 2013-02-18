FactoryGirl.define do
  factory :ecm_courses_course_date, :class => Ecm::Courses::CourseDate do
    ecm_courses_course
    end_at 6.days.from_now
    start_at 5.days.from_now
  end
end
