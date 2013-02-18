require 'spec_helper'

module Ecm::Courses
  describe Course do
    context 'associations' do
      it { should belong_to :ecm_courses_course_category }
      it { should have_many :ecm_courses_course_dates }
    end # context 'associations'

    context 'validations' do
      it { should validate_presence_of :ecm_courses_course_category }
      it { should ensure_inclusion_of(:locale).in_array(I18n.available_locales.map(&:to_s)) }
    end # context 'validations'

    context '#heading_name' do
      subject do
        FactoryGirl.create(:ecm_courses_course,
          :locale => 'en',
          :name => 'This is an example course!'
        )
      end # subject

      its(:heading_name) { should eq('[en] This is an example course!') }
    end # context '#heading_name'

    context '#to_s' do
      subject { FactoryGirl.build(:ecm_courses_course) }

      it 'should build the correct string' do
        subject.to_s.should eq("#{subject.ecm_courses_course_category.name} - #{subject.name}")
      end
    end # context '#heading_name'

    context '#to_param' do
      subject { FactoryGirl.create(:ecm_courses_course, :name => 'This is an example course!') }
      its(:to_param) { should eq('this-is-an-example-course') }
    end # context '#to_param'
  end # describe
end

