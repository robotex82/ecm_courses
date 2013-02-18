require 'spec_helper'

module Ecm
  module Courses
    describe CourseCategoriesController do
      describe "GET index" do
        it "assigns all course categories to @course_categories" do
          course_categories = FactoryGirl.create_list(:ecm_courses_course_category, 3)
          get :index
          assigns(:course_categories).should eq(course_categories)
        end
      end

      describe "GET show" do
        it "assigns the correct course category to @course_category" do
          course_category = FactoryGirl.create(:ecm_courses_course_category)
          get :show, :id => course_category
          assigns(:course_category).should eq(course_category)
        end
      end
    end
  end
end

