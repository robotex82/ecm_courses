FactoryGirl.define do
  factory :ecm_courses_course, :class => Ecm::Courses::Course do
    # name "#{Faker::Product.product} training"
    sequence(:name) { |i| "Course ##{i}" }
    ecm_courses_course_category
  end
end
