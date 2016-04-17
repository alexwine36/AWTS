class Project
  include Mongoid::Document
  include Mongoid::Timestamps


  belongs_to :customer

  # field :customer_id, type: Referenced
  field :_id, type: String, default: ->{name.to_s.parameterize+'-'+reference.to_s.parameterize}
  field :name, type: String
  field :description, type: String
  field :reference, type: String

  validates_presence_of :name




end
