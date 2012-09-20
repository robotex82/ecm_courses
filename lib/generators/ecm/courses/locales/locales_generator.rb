module Ecm
  module Courses
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_locales
          copy_file "ecm.courses.en.yml", "config/locales/ecm.courses.en.yml"
          copy_file "ecm.courses.de.yml", "config/locales/ecm.courses.de.yml"

          copy_file "ecm.courses.course.en.yml", "config/locales/ecm.courses.course.en.yml"
          copy_file "ecm.courses.course.de.yml", "config/locales/ecm.courses.course.de.yml"

          copy_file "ecm.courses.course_category.en.yml", "config/locales/ecm.courses.course_category.en.yml"
          copy_file "ecm.courses.course_category.de.yml", "config/locales/ecm.courses.course_category.de.yml"

          copy_file "ecm.courses.course_date.en.yml", "config/locales/ecm.courses.course_date.en.yml"
          copy_file "ecm.courses.course_date.de.yml", "config/locales/ecm.courses.course_date.de.yml"

          copy_file "ecm.courses.routes.en.yml", "config/locales/ecm.courses.routes.en.yml"
          copy_file "ecm.courses.routes.de.yml", "config/locales/ecm.courses.routes.de.yml"
        end
      end
    end
  end
end

