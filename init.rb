require 'redmine'
require_relative 'lib/logs/issue_after_save_patch'

Rails.application.config.to_prepare do
  require_dependency 'issue'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Issue.included_modules.include? RedmineIssueLogs::IssuePatch
    Issue.send(:include, RedmineIssueLogs::IssuePatch)
  end
end


Redmine::Plugin.register :redmine_issue_logs do
  name 'Redmine Issue Logs'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'



  permission :issue_logs, { issue_logs: [:index] }, public: true
  menu :project_menu, :issue_logs, { controller: 'issue_logs', action: 'index' }, caption: 'Issue Logs', after: :activity, param: :project_id

  project_module :issue_logs do
    permission :view_logs, issue_logs: :index
  end

end

