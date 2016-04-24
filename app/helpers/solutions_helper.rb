module SolutionsHelper
  def status_color(status)
    color = ''
    if status == 'In Progress'
      color = 'green'
    end
    if status == 'Closed'
      color = 'red'
    end
    if status == 'Researching'
      color = 'yellow'
    end
    return color
  end
  def status_icon(status)
    icon = ''
    if status == 'In Progress'
      icon = 'check_circle'
    end
    if status == 'Closed'
      icon = 'lock'
    end
    if status == 'Researching'
      icon = 'search'
    end
    return icon
  end

  def solutions_ref(goal)
    sol_count = goal.solutions.count
    sol_count.to_s.rjust(2,'0')
  end
end

