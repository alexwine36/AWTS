class Goal

  include Mongoid::Document
  # field :_id, type: String, default: ->{display.to_s.parameterize}
  field :reference, type: String
  field :problem, type: String


  embeds_many :solutions, class_name: 'Solution'
  embedded_in :project

  accepts_nested_attributes_for :solutions

  # def goal_id
  #   # "#{display} - #{first_name} #{last_name}"
  #
  #
  # end

  # def solution_attributes=(attributes)
  #   @solution = Solution.new(attributes)
  # end


end

# class Solution
#   include ActiveAttr::Model
#   attribute :description
# end