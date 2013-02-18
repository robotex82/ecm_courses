require 'spec_helper'

module Ecm::Courses
  describe CourseDate do
    context 'associations' do
      it { should belong_to :ecm_courses_course }
      it { should have_one(:ecm_courses_course_category).through(:ecm_courses_course  ) }
    end # context 'associations'

    context 'validations' do
      it { should validate_presence_of :ecm_courses_course }
      it { should validate_presence_of :start_at }
      it { should validate_presence_of :end_at }
    end # context 'validations'

    context '#duration_in_minutes' do
      subject { CourseDate.new(:start_at => Time.zone.now, :end_at => Time.zone.now + 1.5.hours) }

      its(:duration_in_minutes) { should eq(90) }
    end # context '#duration_in_minutes'

    context '#set_defaults' do
      subject { CourseDate.new }

      its(:start_at) { should eq(6.hours.from_now.change( :min => 0 )) }
      its(:end_at)   { should eq(7.hours.from_now.change( :min => 0 )) }
    end # context '#set_defaults'

    context '#to_s' do
    end

    context '#for_month' do
      before do
        FactoryGirl.create(:ecm_courses_course_date,
                           :start_at => Time.zone.now,
                           :end_at => Time.zone.now + 1)
      end # before

      it 'should include course dates for the given month' do
        CourseDate.for_month(Time.zone.now).count.should eq(1)
      end # it
    end # context '#for_month'
  end # describe CourseDate
end

