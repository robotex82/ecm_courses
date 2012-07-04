module Ecm
  module Courses
    class Engine < Rails::Engine
      # Add locales
      paths["config/locales"] << File.dirname(__FILE__) + '/../../../config/locales'
    end
  end
end    
