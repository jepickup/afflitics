class Network
  include Mongoid::Document

  field :name, type: String

  embeds_many :services
  has_many :subscriptions

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  #validates_associated :service
end

class Service
  include Mongoid::Document

  field :url, type: String
  field :type, type: String

  embeds_many :functions

  validates_presence_of :type
  #validates_associated :function
end

class Function
  include Mongoid::Document

  field :request, type: String
  field :function, type:String

  validates_presence_of :request, :function
  validates_uniqueness_of :request, :function
end
