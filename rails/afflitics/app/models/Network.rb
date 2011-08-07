class Network
  include MongoMapper::Document
  
  key :name,  String
  
  has_many :Services
end