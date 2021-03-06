if defined?(ActiveAdmin)
  include ActiveAdmin::ActsAsList::Helper
  include ActiveAdmin::AwesomeNestedSet::Helper
  
  ActiveAdmin.register Ecm::Courses::CourseCategory do
    # menu entry settings
    menu :parent => I18n.t('ecm.courses.active_admin.menu')

    # sorting
    config.sort_order = 'lft_asc'
    
    # awesome nested set
    sortable_tree_member_actions
    
    form do |f|
      f.inputs do
        f.input :parent, :as => :select, 
                         :collection => nested_set_options(Ecm::Courses::CourseCategory, f.object) { |cc| "#{'-' * cc.level} #{cc.name}" }
        f.input :locale, :as => :select,
                         :collection => I18n.available_locales.map(&:to_s)
        f.input :name
        f.input :description
      end
      
      f.actions
    end
    
    index do
      selectable_column
      sortable_tree_columns
      column :index_name      
#      column :locale
#      column :parent
#      column :name
      column :description
      column :ecm_courses_courses_count
      default_actions
    end
    
    
    
    show :title => :to_s do
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
      
      panel Ecm::Courses::CourseCategory.human_attribute_name(:children) do
        table_for ecm_courses_course_category.children, :i18n => Ecm::Courses::CourseCategory do
#          column(:name) { |ecm_courses_course| link_to ecm_courses_course, [:admin, ecm_courses_course] }
          sortable_tree_columns
          column(:index_name) { |ecm_courses_course_category| link_to ecm_courses_course_category, [:admin, ecm_courses_course_category] }  
    #      column :locale
    #      column :parent
    #      column :name
          column :description
          column :ecm_courses_courses_count
        end
      end        
      
      panel Ecm::Courses::CourseCategory.human_attribute_name(:ecm_courses_courses) do
        table_for ecm_courses_course_category.ecm_courses_courses, :i18n => Ecm::Courses::Course do
          sortable_columns
          column :locale
          column(:name) { |ecm_courses_course| link_to ecm_courses_course, [:admin, ecm_courses_course] }
          column :ecm_courses_course_dates_count
          column :description
        end
      end              
    end
  end
end  
