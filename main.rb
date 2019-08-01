require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/photo'

get '/' do
  erb :index
end

get '/events' do
  @events = Event.all
  erb :events
end

get '/photos' do
  @photos = Photo.all
  erb :photos
end