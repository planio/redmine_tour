require 'redmine'

Redmine::Plugin.register :redmine_tour do
  name 'Redmine Tour plugin'
  author 'Jan Schulz-Hofen, Planio GmbH (http://plan.io)'
  description 'Redmine tour for first-time users'
  version '1.1.0'
  
  settings :default => {
    'app_name' => 'Planio',
    'repo_host_base' => 'plan.io',
    'repo_host' => nil,
    'git_enabled' => true,
    'svn_enabled' => true
  }
  
  menu :top_menu, :tour, 'http://plan.io/contact', :last => true, :html => {:onclick => 'return showTour();', :target => '_blank'}, :caption => :label_help
end

# initialize hooks
class RedmineTourBaseHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_before_content, :partial => 'tour/base'
end

class RedmineTourTabHook < Redmine::Hook::ViewListener
  render_on :view_layouts_tab_before_content, :partial => 'tour/tab'
end

Redmine::MenuManager.map :top_menu do |menu|
  menu.delete :help
end

Dispatcher.to_prepare do
  ApplicationHelper.send(:include, RedmineTour::Patches::ApplicationHelperPatch)
end