class IssueLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :issue
end
