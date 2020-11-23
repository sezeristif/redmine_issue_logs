class IssueLogsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @logs = IssueLog.all.where(project: @project)
    if params[:sort] == 'ASC'
      @logs = @logs.order('id ASC')
    elsif params[:sort] == 'DESC'
      @logs = @logs.order('id DESC')
    end

  end

  def sort_by
    @logs = IssueLog.all.where(project: @project)
  end

end
