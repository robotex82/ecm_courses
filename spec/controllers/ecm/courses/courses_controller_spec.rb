require 'spec_helper'

module Ecm
  module Courses
    describe CoursesController do
      describe "GET calendar" do
        it "assigns the correct course to @course" do
          course = FactoryGirl.create(:ecm_courses_course)
          get :calendar, :id => course, :year => Time.zone.now.year, :month => Time.zone.now.month
          assigns(:course).should eq(course)
        end
      end

      describe "GET index" do
        it "assigns all courses to @courses" do
          courses = FactoryGirl.create_list(:ecm_courses_course, 3)
          get :index
          assigns(:courses).should eq(courses)
        end
      end

      describe "GET show" do
        it "assigns the correct course to @course" do
          course = FactoryGirl.create(:ecm_courses_course)
          get :show, :id => course
          assigns(:course).should eq(course)
        end
      end
    end
  end
end

