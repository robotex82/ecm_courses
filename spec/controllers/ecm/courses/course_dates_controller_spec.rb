require 'spec_helper'

module Ecm
  module Courses
    describe CourseDatesController do
      describe "GET index" do
        it "assigns all course dates to @course_dates" do
          course_dates = FactoryGirl.create_list(:ecm_courses_course_date, 3)
          get :index
          assigns(:course_dates).should eq(course_dates)
        end
      end

      describe "GET show" do
        it "assigns the correct course date to @course_date" do
          course_date = FactoryGirl.create(:ecm_courses_course_date)
          get :show, :id => course_date
          assigns(:course_date).should eq(course_date)
        end
      end
    end
  end
end

