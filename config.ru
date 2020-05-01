require "thin"
require "resque"
require "resque/server"
require "resque/scheduler/server"

Resque.redis = Redis.new(url: ENV["REDIS_URL"])
run Rack::URLMap.new "/" => Resque::Server.new
