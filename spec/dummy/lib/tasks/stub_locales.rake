require 'pp'

class Hash
  def dig(*path)
    path.inject(self) do |location, key|
      location.respond_to?(:keys) ? location[key] : nil
    end
  end
end


namespace :locales do
  desc "Stubs out locale files for all active record descendants."
  task :stub, [] => [:environment] do |t, args|
    # Loop over all AR models
    ActiveRecord::Base.descendants.each do |model|
      # Loop over available locales
      I18n.available_locales.each do |locale|
        g = LocaleGenerator.new(model, locale)
        if g.load_file
          p " -> Loaded locale file for #{model}:#{locale.to_s}"
          if g.has_new_keys
            p "  -> Adding keys: #{g.new_keys.join(", ")}"
          end  
        else  
          p " -> Creating new locale file for #{model}:#{locale.to_s}"        
        end
        if g.save_file
          p "  -> Saved #{g.filename}"
        else
          p "  -> Error saving #{g.filename}"
        end
      end
    end
  end
end
