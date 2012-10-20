require 'spec_helper'

module Ecm
  module Courses
    describe CourseDate do
      subject { FactoryGirl.build(:ecm_courses_course_date) }

      # associations
      it { should belong_to(:ecm_courses_course) }
      it { should have_one(:ecm_courses_course_category) }

      # validations
      it { should validate_presence_of(:ecm_courses_course) }
      it { should validate_presence_of(:end_at) }
      it { should validate_presence_of(:start_at) }

      # methods
      it "should calculate the duration" do
        now = Time.zone.now
        course_date = FactoryGirl.build(:ecm_courses_course_date, :start_at => now + 1.hour, :end_at => now + 2.hours)
        course_date.duration_in_minutes.should == 60
      end

      # named scopes
      context '#for_month' do
        it 'should return the course dates for last day of the given month' do
          course_date = FactoryGirl.build(:ecm_courses_course_date)
          course_date.start_at = Time.zone.now.end_of_month
          course_date.end_at = course_date.end_at + 180.minutes
          course_date.save!

          Ecm::Courses::CourseDate.for_month(Time.zone.now.to_date).all.should include(course_date)
        end

        it 'should not return the course dates that are not in the given month' do
          course_date = FactoryGirl.build(:ecm_courses_course_date)
          course_date.start_at = Time.zone.now
          course_date.end_at = course_date.end_at + 180.minutes
          course_date.save!

          last_month_course_date = FactoryGirl.build(:ecm_courses_course_date)
          last_month_course_date.start_at = Time.zone.now - 1.month
          last_month_course_date.end_at = course_date.end_at + 180.minutes
          last_month_course_date.save!

          Ecm::Courses::CourseDate.for_month(Time.zone.now.to_date).all.should_not include(last_month_course_date)
        end
      end
    end
  end
end

