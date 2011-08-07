class Service
  include MongoMapper::Document
  
  key :name,  String
  key :urls,  Hash
  
  belongs_to :Network
end