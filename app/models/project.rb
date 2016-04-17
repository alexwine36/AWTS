class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  # embeds_many :goals

  belongs_to :customer

  # field :customer_id, type: Referenced
  field :_id, type: String, default: ->{name.to_s.parameterize+'-'+reference.to_s.parameterize}
  field :name, type: String
  field :description, type: String
  field :reference, type: String

  validates_presence_of :name

  # accepts_nested_attributes_for :goals, :reject_if => proc {|attributes|
  #   attributes.all? {|k,v| v.blank?}
  # }, allow_destroy: true




end
