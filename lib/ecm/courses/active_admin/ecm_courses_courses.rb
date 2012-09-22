if defined?(ActiveAdmin)
  include ActiveAdmin::ActsAsList::Helper
  
  ActiveAdmin.register Ecm::Courses::Course do
    # acts as list
    sortable_member_actions
  
    # menu config
    menu :parent => I18n.t('ecm.courses.active_admin.menu')

    form do |f|
      f.inputs do
        f.input :ecm_courses_course_category, :as => :select, 
                                              :collection => nested_set_options(Ecm::Courses::CourseCategory) { |cc| "#{'-' * cc.level} #{cc.name}" }
        f.input :locale, :as => :select, 
                         :collection => I18n.available_locales.map(&:to_s)
        f.input :name
        f.input :description
      end
      
      f.actions
    end
    
    index do
      selectable_column
      column :locale      
      column :ecm_courses_course_category
      column :name
      column :ecm_courses_course_dates_count      
      column :description
      default_actions
    end
    
    show :title => :to_s do
      attributes_table do
        row :ecm_courses_course_category
        row :locale
        row :ecm_courses_course_dates_count
        row :created_at
        row :updated_at
      end
      
      panel Ecm::Courses::Course.human_attribute_name(:description) do
        div do
          ecm_courses_course.description
        end
      end
      
      panel Ecm::Courses::Course.human_attribute_name(:ecm_courses_course_dates) do
        table_for ecm_courses_course.ecm_courses_course_dates, :i18n => Ecm::Courses::CourseDate do
          column(:name) { |ecm_courses_course_date| link_to ecm_courses_course_date, [:admin, ecm_courses_course_date] }
          column :duration_in_minutes
          column :description
        end
      end      
    end
  end
end  
