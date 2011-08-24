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

  field :request_str, type: String
  field :function_str, type:String

  validates_presence_of :request_str, :function_str
  validates_uniqueness_of :request_str, :function_str
end
