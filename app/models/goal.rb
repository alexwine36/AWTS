class Goal

  include Mongoid::Document
  include Mongoid::Timestamps
  field :_id, type: String, default: ->{reference.to_s.parameterize}
  field :reference, type: String
  field :problem, type: String


  embeds_many :solutions, class_name: 'Solution'
  embedded_in :project

  accepts_nested_attributes_for :solutions

  validates_presence_of :problem, :reference

end
