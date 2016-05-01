class Customer

  include Gravtastic
  gravtastic :email

  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :projects


  field :_id, type: String, default: ->{display.to_s.parameterize}
  field :first_name, type: String
  field :last_name, type: String
  field :display, type: String
  field :phone_number, type: String
  field :email, type: String


  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String




  validates_presence_of :display

  def display_title
    "#{display} - #{first_name} #{last_name}"
  end



end
