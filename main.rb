require 'pry'
require 'sinatra'
# require 'sinatra/reloader'
require_relative 'database_config'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/photo'

get '/' do
  erb :index
end

require_relative 'routes/events'
require_relative 'routes/photos'