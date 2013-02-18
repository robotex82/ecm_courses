require 'spec_helper'

module Ecm::Courses
  describe CourseCategory do
    context 'associations' do
      it { should have_many :ecm_courses_courses }
    end # context 'associations'

    context 'validations' do
      it { should validate_presence_of :name}
      it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
      it { should ensure_inclusion_of(:locale).in_array(I18n.available_locales.map(&:to_s)) }
    end # context 'validations'

    context '#index_name' do
    end # context '#index_name'

    context '#to_param' do
      subject { FactoryGirl.create(:ecm_courses_course_category, :name => 'This is an example course category!') }
      its(:to_param) { should eq('this-is-an-example-course-category') }
    end # context '#to_param'

    context '#to_s' do
      subject { FactoryGirl.build(:ecm_courses_course_category, :name => 'This is an example course category!').to_s }
      it { should eq('This is an example course category!') }
    end # context '#to_s'

    context '#tree_name' do
      subject do
        FactoryGirl.build(:ecm_courses_course_category,
          :locale => 'en',
          :name => 'This is an example course category!'
        ).tree_name
      end
      it { should eq('[en] This is an example course category!') }
    end # context '#tree_name'

  end # describe Course
end
