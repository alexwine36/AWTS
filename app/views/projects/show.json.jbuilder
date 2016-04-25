# json.extract! @project, :id, :name, :description, :reference, :created_at, :updated_at

json.project do
  json.id @project.id
  json.name @project.name
  json.description @project.description
  json.created_at @project.created_at
  json.updated_at @project.updated_at
  json.customer do
    json.first_name @project.customer.first_name
    json.last_name @project.customer.last_name
    json.display @project.customer.display
    json.phone_number @project.customer.phone_number
    json.email @project.customer.email
    json.url customer_url(@project.customer, format: :json)
  end
  json.goals @project.goals do |goal|
    json.id goal.id
    json.problem goal.problem
    json.url project_goal_path(@project, goal)
    json.solutions goal.solutions do |solution|
      json.id solution.id
      json.description solution.description
      json.url project_goal_solution_path(@project, goal, solution)
    end
  end

end