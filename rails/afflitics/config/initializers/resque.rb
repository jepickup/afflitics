Dir["#{Rails.root}/app/runners/*.rb"].each { |file| require file }

require 'resque_scheduler'
Resque.schedule = YAML.load_file("#{Rails.root}/config/stat_schedule.yml")
