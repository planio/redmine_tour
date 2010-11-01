require 'redmine'


Redmine::Plugin.register :redmine_tour do
  name 'Redmine Tour plugin'
  author 'Jan Schulz-Hofen, ROCKET RENTALS GmbH'
  description 'Redmine tour for first-time users'
  version '1.0.0'
  
  settings :default => {
    'repo_host_base' => 'plan.io',
    'repo_host' => nil
  }
  
  menu :top_menu, :tour, 'http://plan.io/kontakt', :last => true, :html => {:onclick => 'return showTour();', :target => '_blank'}, :caption => :label_help
end

# initialize hook
class RedmineTourHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_before_content, :partial => 'tour/base'
end

Redmine::MenuManager.map :top_menu do |menu|
  menu.delete :help
end