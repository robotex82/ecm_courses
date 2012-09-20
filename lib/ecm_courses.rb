require 'rubygems'

require 'rails_tools-absence_validator'
require 'acts_as_list'
require 'awesome_nested_set'
require 'awesome_nested_set-tools'
require 'friendly_id'

require 'active_admin-acts_as_list'

# Ecm::Admin should do this!
require 'activeadmin' 
require 'sass-rails'
require 'meta_search'

require 'ecm/courses/engine'
require 'ecm/courses/configuration'
require 'ecm/courses/routing'

module Ecm
  module Courses
    extend Configuration
  end
end
