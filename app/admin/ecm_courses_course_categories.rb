if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Courses::CourseCategory do
    form do |f|
      f.inputs do
        f.input :parent
        f.input :locale
        f.input :name
        f.input :description
      end
      
      f.actions
    end
  end
end  
