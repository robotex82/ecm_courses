module Ecm
  module Courses
    class Routing
      # Creates the routes for courses and categories. You can pass options to
      # specify the actions for both courses and/or categories.
      #
      #   Ecm::Courses::Routing.routes(self, { :course_category_actions => [ :show ]})
      #
      # This will only create the show action for course categories, but omit the index action.
      def self.routes(router, options = {})
        options.reverse_merge!(
          { 
            :course_category_actions => [:index, :show], 
            :course_date_actions     => [:index, :show],
            :course_actions          => [:calendar, :index, :show] 
          }
        )

        router.resources :ecm_courses_course_categories, :only => options[:course_category_actions], :controller => 'ecm/courses/course_categories'
        router.resources :ecm_courses_courses, :only => options[:course_actions], :controller => 'ecm/courses/courses' do
          router.member do
            if options[:course_actions].include?(:calendar)
              router.get "calendar", :action => :calendar
              router.get "calendar/:year/:month", :action => :calendar
            end  
          end
        end

        router.resources :ecm_courses_course_dates, :only => options[:course_date_actions], :controller => 'ecm/courses/course_dates'
      end  
    end
  end
end    
