module RedmineIssueLogs
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable

        after_save :log_issue_update

        # unless respond_to?(:visible)
        #   named_scope :visible, lambda {|*args| { :include => :project,
        #                                           :conditions => Project.allowed_to_condition(args.first || User.current, :view_issues) } }
        # end
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods

    def log_issue_update

      unless self.previous_changes['status_id'].first == nil
    IssueLog.create(  old_status: self.previous_changes['status_id'].first,
                      new_status:  self.previous_changes['status_id'].last,
                      initiating_user_id: self.author.id,
                      time_spent: (self.previous_changes['updated_on'].last.time - self.previous_changes['updated_on'].first.time),
                      project_id: self.project.id,
                      issue_id: self.id)
      end


    end
  end
end