class Solution
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{ ref.to_s.parameterize }
  field :ref, type: String
  field :description, type: String
  field :status, type: String

  embedded_in :goal
  validates_presence_of :description, :status


end
