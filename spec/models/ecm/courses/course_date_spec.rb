module Ecm
  module Courses
    describe CourseDate do
      subject { FactoryGirl.build(:ecm_courses_course_date) }
      
      # associations
      it { should belong_to(:ecm_courses_course) }
      
      # validations
      it { should validate_presence_of(:ecm_courses_course) }
      it { should validate_presence_of(:end_at) }      
      it { should validate_presence_of(:start_at) }
    end
  end
end      
