if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Courses::Course do
    form do |f|
      f.inputs do
        f.input :ecm_courses_course_category
        f.input :locale
        f.input :name
        f.input :description
      end
      
      f.actions
    end
  end
end  
