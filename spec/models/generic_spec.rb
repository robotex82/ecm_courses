describe "ActiveRecord::Base models" do
  ActiveRecord::Base.descendants.map(&:to_s).each do |model_name|
    model = model_name.constantize
    describe model do
      it "should be an ActiveRecord::Base" do
        ActiveRecord::Base.descendants.should include(model)
      end
      
      it " => new" do
        new_instance = model.new
        new_instance.should be_a model
      end
      
      it "should be valid with correct attribute values" do
        valid_instance = Factory(model.to_s.tableize.singularize.underscore.gsub( '/', '_'))
        valid_instance.should be_valid
      end
    end
  end
end
