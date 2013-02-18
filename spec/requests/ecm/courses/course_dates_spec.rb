require 'spec_helper'

describe 'Ecm::Courses::CourseDate requests' do
  def set_resource_class
    @resource_class = Ecm::Courses::CourseDate
  end

  before do
    set_resource_class
    @path_prefix = ''
    @resource_path = @resource_class.to_s.underscore.gsub('/', '_').pluralize
    @resource_factory_name = @resource_class.to_s.underscore.gsub('/', '_').to_sym
  end # background

  describe 'show' do
    before do
      @resource = FactoryGirl.create(@resource_factory_name)
      get "#{@path_prefix}/#{@resource_path}/#{@resource.to_param}"
    end

    it "request should be successful" do
      response.code.should eq("200")
    end

    it "should render the show template" do
      response.should render_template(:show)
    end
  end

  describe 'index' do
    before do
      get "#{@path_prefix}/#{@resource_path}"
    end

    it "request should be successful" do
      response.code.should eq("200")
    end

    it "should render the index template" do
      response.should render_template(:index)
    end
  end
end

