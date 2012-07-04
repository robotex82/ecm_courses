module Ecm
  module Courses
    class Engine < Rails::Engine
      # active admin
      initializer :ecm_courses_engine do
        ActiveAdmin.setup do |active_admin_config|
          active_admin_config.load_paths += Dir[File.dirname(__FILE__) + '/../../../app/admin']
        end
      end 
      
      # locales
      paths["config/locales"] << File.dirname(__FILE__) + '/../../../config/locales'
    end
  end
end    
