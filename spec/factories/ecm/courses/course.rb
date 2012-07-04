FactoryGirl.define do
  factory :ecm_courses_course, :class => Ecm::Courses::Course do
    # name "#{Faker::Product.product} training"
    name "How to make fire with magnifying glasses"
    ecm_courses_course_category
  end
end
