if ENV['MONGOHQ_URL']
 MongoMapper.config = {ENV => {'uri' => ENV['MONGOHQ_URL']}}
else
  if Rails.env.development?
    MongoMapper.config = {ENV => {'uri' => 'mongodb://localhost:27017/afflitics'}}
  else
    MongoMapper.config = {ENV => {'uri' => 'mongodb://localhost:27017/afflitics_test'}}
  end
end

MongoMapper.connect(ENV)
