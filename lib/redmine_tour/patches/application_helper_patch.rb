module RedmineTour
  module Patches
    module ApplicationHelperPatch
      
      def render_tabs_with_tour(tabs)

        #tabs.map{|tab| render :partial => 'tour/base', :locals => {:tab => tab[:name]}} + render_tabs_without_tour(tabs)
      end
      
      
      def self.included(klass)
        # klass.send :alias_method_chain, :render_tabs, :tour
      end
    end
  end
end