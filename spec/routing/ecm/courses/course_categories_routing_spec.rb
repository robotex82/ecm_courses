require 'spec_helper'

describe "routing to course categories" do
  it "routes /ecm_courses_course_categories to #index" do
    expect(:get => "/ecm_courses_course_categories").to route_to(
      :controller => "ecm/courses/course_categories",
      :action => "index"
    )
  end # it

  it "routes /ecm_courses_course_categories/example-course-category to #show" do
    expect(:get => "/ecm_courses_course_categories/example-course-category").to route_to(
      :controller => "ecm/courses/course_categories",
      :action => "show",
      :id => "example-course-category"
    )
  end # it

#  it "routes /ecm_courses_course_categories/example-course-category/2013/02 to #show" do
#    expect(:get => "/ecm_courses_course_categories/example-course-category/2013/02").to route_to(
#      :controller => "ecm/courses/course_categories",
#      :action => "show",
#      :id => "example-course-category",
#      :year => "2013",
#      :month => "02"
#    )
#  end # it
end
