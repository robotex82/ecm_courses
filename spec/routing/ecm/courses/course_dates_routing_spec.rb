require 'spec_helper'

describe "routing to course dates" do
  it "routes /ecm_courses_course_dates to #index" do
    expect(:get => "/ecm_courses_course_dates").to route_to(
      :controller => "ecm/courses/course_dates",
      :action => "index"
    )
  end # it

  it "routes /ecm_courses_course_dates/example-course-date to #show" do
    expect(:get => "/ecm_courses_course_dates/example-course-date").to route_to(
      :controller => "ecm/courses/course_dates",
      :action => "show",
      :id => "example-course-date"
    )
  end # it
end

