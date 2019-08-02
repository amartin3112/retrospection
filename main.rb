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
  @events = Event.all.order(:start_at).reverse
  erb :events
end

get '/photos' do
  @photos = Photo.all.order(:timestamp).reverse
  erb :photos
end

get '/photos/:id' do
  erb :show_photo
end

get '/photos/add' do
  erb :add_photo
end

post '/photos' do
  photo = Photo.new
  photo.image_url = params[:image_url]
  photo.timestamp = Time.now # use timestamp from photo
  photo.user_id = 1 # need to make this dynamic
  # photo.event_id # optional
  photo.save
  redirect '/photos/add'
end