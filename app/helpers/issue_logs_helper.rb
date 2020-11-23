module IssueLogsHelper

  def status_finder(id)
    if id == 1
      "New"
    elsif id == 2
      "In Progress"
    elsif id == 3
      "Resolved"
    elsif id == 4
      "Feedback"
    elsif id == 5
      "Closed"
    elsif id == 6
      "Rejected"
    else
      'Undefined'
    end
  end


  def seconds_to_hms(sec)
    "%02d:%02d:%02d" % [sec / 3600, sec / 60 % 60, sec % 60]
  end

  def find_user(id)
    User.find(id)
  end
end
