require 'redmine'


Redmine::Plugin.register :redmine_tour do
  name 'Redmine Tour plugin'
  author 'Jan Schulz-Hofen'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  menu :top_menu, :tour, 'http://plan.io/kontakt', :last => true, :html => {:onclick => 'return showTour();', :target => '_blank'}, :caption => :label_help
end

# initialize hook
class RedmineTourHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_before_content, :partial => 'tour/base'
end

# provide tour_preferences hash
User.send(:serialize, :tour_preferences, Hash)

Redmine::MenuManager.map :top_menu do |menu|
  menu.delete :help
end



