class Goal
  include Mongoid::Document
  # field :_id, type: String, default: ->{display.to_s.parameterize}
  field :reference, type: String
  field :problem, type: String

  embedded_in :project



  # def goal_id
  #   # "#{display} - #{first_name} #{last_name}"
  #
  #
  # end


end
