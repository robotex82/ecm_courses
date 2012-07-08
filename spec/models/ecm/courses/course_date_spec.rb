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
    end
  end
end      
