require 'redmine'

Redmine::Plugin.register :redmine_tour do
  name 'Redmine Tour plugin'
  author 'Jan Schulz-Hofen'
  description 'This is a plugin for Redmine'
  version '0.0.1'
end

# initialize hook
class RedmineTourHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_before_content, :partial => 'tour/base'
end
