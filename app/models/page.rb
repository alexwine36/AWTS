class Page
  include Mongoid::Document

  field :title, type: String
  field :content, type: String

  index({ title: 1 }, { unique: true, name: "title_index" })

  validates_presence_of :title, :content
end
