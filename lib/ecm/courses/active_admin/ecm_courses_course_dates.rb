if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Courses::CourseDate do
    # menu config
    menu :parent => I18n.t('ecm.courses.active_admin.menu')
    
    form do |f|
      f.inputs do
        f.input :ecm_courses_course, :as => :select, 
                                     :collection => Ecm::Courses::Course.all.collect { |ecc| [ecc, ecc.id] }
        f.input :start_at
        f.input :end_at
        f.input :description
      end
      
      f.actions
    end
  
    index do
      selectable_column
      column :ecm_courses_course_category
      column :ecm_courses_course
      column :start_at
      column :end_at
      column :duration_in_minutes
      column :description
      default_actions
    end
    
    show :title => :to_s do
      attributes_table do
        row :ecm_courses_course_category
        row :ecm_courses_course
        row :duration_in_minutes
        row :start_at
        row :end_at        
        row :created_at
        row :updated_at        
      end
      
      panel Ecm::Courses::CourseDate.human_attribute_name(:description) do
        div do
          ecm_courses_course_date.description
        end
      end
    end
  end
end  
