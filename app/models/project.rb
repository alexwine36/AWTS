class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{name.to_s.parameterize+'-'+reference.to_s.parameterize}
  field :name, type: String
  field :description, type: String
  field :reference, type: String

  validates_presence_of :name

  scope :thisMonth, -> { where("created_at >= #{ DateTime.now.beginning_of_month }") }

end
