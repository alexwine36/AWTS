module GoalsHelper

  def goal_ref(project)
    letters = ('AA'..'ZZ').to_a
    pProj = Project.find(project)

    gCount = pProj.goals.count

    return p letters[gCount]

  end

  def goal_status(goal)
    if !goal.solutions.first.nil?
      latest = goal.solutions.order(updated_at: :desc).first
      lt = latest.updated_at
    else
      lt = goal.updated_at
    end

    color = ""
    if (lt < DateTime.now-15.days)
      color = "red"
    elsif (lt < DateTime.now-7.days)
      color = "yellow"
    else
      color = "blue"
    end

    return p color
  end

  # def project_id
  #   date = DateTime.now.to_date
  #   pid = date.strftime('%m%d%y')
  #   pCount = Project.where(created_at: (DateTime.now.beginning_of_month)..(DateTime.now.end_of_month)).count
  #   pCount += 1
  #   pid = pid.to_s + pCount.to_s.rjust(3,'0')
  #   return pid
  # end
end
