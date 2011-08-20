require 'redis'
require 'resque'
require 'resque_scheduler'

Resque.schedule = YAML.load_file(File.join(File.dirname(__FILE__), '../stat_schedule.yml'))
