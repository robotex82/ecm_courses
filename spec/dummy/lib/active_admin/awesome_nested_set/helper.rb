module ActiveAdmin
  module AwesomeNestedSet
    module Helper
      # Call this inside your index do...end bock to make your resource sortable.
      #
      # Example:
      #
      # #app/admin/players.rb
      #
      #  ActiveAdmin.register Player do
      #    index do
      #      # This adds columns for moving up, down, top and bottom.
      #      sortable_tree_columns    
      #      #...
      #      column :firstname
      #      column :lastname
      #      default_actions
      #    end
      #  end
      def sortable_tree_columns
#        column "&#9650;&#9650;".html_safe do |resource|
#          link_to("&#9650;&#9650;".html_safe, self.send(:"move_to_top_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") unless resource.first?
#        end
        column "&#9650;".html_safe do |resource|
          link_to("&#9650;".html_safe, self.send(:"move_up_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.left_sibling
        end
        column "&#9660;".html_safe do |resource|
          link_to("&#9660;".html_safe, self.send(:"move_down_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.right_sibling
        end
#        column "&#9660;&#9660;".html_safe do |resource|
#          link_to("&#9660;&#9660;".html_safe, self.send(:"move_to_bottom_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") unless resource.last?
#        end
      end

      # Call this inside your resource definition to add the needed member actions
      # for your sortable resource.
      #
      # Example:
      #
      # #app/admin/players.rb
      #
      #  ActiveAdmin.register Player do
      #    # Sort players by position
      #    config.sort_order = 'position'
      #   
      #    # Add member actions for positioning.
      #    sortable_tree_member_actions
      #  end
      def sortable_tree_member_actions
#       member_action :move_to_top do
#          if resource.first?
#            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_to_top', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
#            return
#          end  
#          
#          resource.move_to_top
#          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_to_top', :resource => resource_class.to_s.camelize.constantize.model_name.human )
#        end
#        
#        member_action :move_to_bottom do
#          if resource.last?
#            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_to_bottom', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
#            return
#          end  
#          
#          resource.move_to_bottom
#          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_to_bottom', :resource => resource_class.to_s.camelize.constantize.model_name.human )
#        end

        member_action :move_up do
          unless resource.left_sibling
            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_up', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
            return
          end  
          
          resource.move_left
          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_up', :resource => resource_class.to_s.camelize.constantize.model_name.human )
        end

        member_action :move_down do
          unless resource.right_sibling
            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_down', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
            return
          end  
          
          resource.move_right
          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_down', :resource => resource_class.to_s.camelize.constantize.model_name.human )
        end    
      end
    end
  end  
end     
