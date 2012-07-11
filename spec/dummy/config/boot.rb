require 'rubygems'
gemfile = File.expand_path('../../../../Gemfile', __FILE__)

# Switch yaml engine
YAML::ENGINE.yamler= 'syck' if defined?(YAML::ENGINE)

if File.exist?(gemfile)
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
end

$:.unshift File.expand_path('../../../../lib', __FILE__)
