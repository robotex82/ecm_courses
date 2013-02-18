require 'spec_helper'

describe "routing to courses" do
  it "routes /ecm_courses_courses/example-course/calendar/2013/02 to #calendar" do
    expect(:get => "/ecm_courses_courses/example-course/calendar/2013/02").to route_to(
      :controller => "ecm/courses/courses",
      :action => "calendar",
      :id => "example-course",
      :year => "2013",
      :month => "02"
    )
  end # it

  it "routes /ecm_courses_courses to #index" do
    expect(:get => "/ecm_courses_courses").to route_to(
      :controller => "ecm/courses/courses",
      :action => "index"
    )
  end # it

  it "routes /ecm_courses_courses/example-course to #show" do
    expect(:get => "/ecm_courses_courses/example-course").to route_to(
      :controller => "ecm/courses/courses",
      :action => "show",
      :id => "example-course"
    )
  end # it
end
