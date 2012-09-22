require 'active_admin-acts_as_list'
require 'acts_as_list'
require 'awesome_nested_set'
require 'awesome_nested_set-tools'
require 'ecm_calendar_helper'
require 'friendly_id'
require 'rails_tools-absence_validator'

require 'ecm/courses/engine'
require 'ecm/courses/configuration'
require 'ecm/courses/routing'

module Ecm
  module Courses
    extend Configuration
  end
end

