module Ecm
  module Courses
    describe Course do
      subject { FactoryGirl.create(:ecm_courses_course) }
      
      it { should belong_to(:ecm_courses_course_category) }
      
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:ecm_courses_course_category) }      
      # it { should validate_uniqueness_of(:name).scoped_to(:ecm_courses_course_category_id) }
      
      it "should only accept available locales" do
        course = FactoryGirl.build(:ecm_courses_course, :locale => 'invalid')
        course.should_not be_valid      
      end 
      
      it { should respond_to(:move_higher) }
      
      it "should have a friendly id" do
        course = FactoryGirl.create(:ecm_courses_course, :name => 'This is a course that should have a friendly id!')
        course.to_param.should == 'this-is-a-course-that-should-have-a-friendly-id'
      end 
    end
  end  
end  
