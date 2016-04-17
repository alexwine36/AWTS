module ProjectsHelper
  def project_id
    date = DateTime.now.to_date
    pid = date.strftime('%m%d%y')
    pCount = Project.where(created_at: (DateTime.now.beginning_of_month)..(DateTime.now.end_of_month)).count
    pCount += 1

    pid = pid.to_s + pCount.to_s.rjust(3,'0')


    return pid
  end

  def goal_id

  end

end
