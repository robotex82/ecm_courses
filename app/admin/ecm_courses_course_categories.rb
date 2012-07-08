if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Courses::CourseCategory do
    form do |f|
      f.inputs do
        f.input :parent
        f.input :locale, :as => :select, :collection => I18n.available_locales.map(&:to_s)
        f.input :name
        f.input :description
      end
      
      f.actions
    end
    
    index do
      selectable_column
      column :parent
      column :name
      column :description
      column :locale
      column :ecm_courses_courses_count
      default_actions
    end
    
    menu :parent => I18n.t('ecm.courses.active_admin.menu')
    
    show do
      attributes_table do
        row :parent
        row :locale
        row :name
        row :ecm_courses_courses_count
        row :created_at
        row :updated_at
      end
      
      panel Ecm::Courses::CourseCategory.human_attribute_name(:description) do
        div do
          ecm_courses_course_category.description
        end
      end
      
      panel Ecm::Courses::CourseCategory.human_attribute_name(:ecm_courses_courses) do
        table_for ecm_courses_course_category.ecm_courses_courses, :i18n => Ecm::Courses::Course do
          column(:name) { |ecm_courses_course| link_to ecm_courses_course, [:admin, ecm_courses_course] }
          column :description
          column :locale
        end
      end              
    end
  end
end  
