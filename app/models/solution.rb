class Solution
  include Mongoid::Document
  field :description, type: String

  embedded_in :goal

end
