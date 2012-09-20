require 'spec_helper'

module Ecm
  module Courses
    describe CourseCategory do
      subject { FactoryGirl.build(:ecm_courses_course_category) }

      it { should have_many(:ecm_courses_courses) }

      it "should respond to root" do
        course_category = FactoryGirl.create(:ecm_courses_course_category)
        course_category.should respond_to(:root)
      end

      it "should require a locale if it is a root node" do
        course_category = FactoryGirl.create(:ecm_courses_course_category)
        course_category.should be_root

        course_category.locale = nil
        course_category.should_not be_valid
      end

      it "should not accept a locale if it is not a root node" do
        course_category = FactoryGirl.create(:ecm_courses_course_category_with_parent)
        course_category.should_not be_root

        course_category.locale = I18n.locale
        course_category.should_not be_valid
      end

      it "should only accept available locales" do
        course_category = FactoryGirl.build(:ecm_courses_course_category, :locale => 'invalid')
        course_category.should_not be_valid
      end

      it "should have a friendly id" do
        course_category = FactoryGirl.create(:ecm_courses_course_category, :name => 'Look, a slugged category!')
        course_category.to_param.should == 'look-a-slugged-category'
      end
    end
  end
end

